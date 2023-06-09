C**************************************************************************************
C* DESCRIPTION: GAPCON Subroutine for time dependent and surface name based application
C* 				Draft version of the subroutine was generated by chatGPT (GPT-4)
C* AUTHOR: Youngbin LIM
C* CONTACT: lyb0684@naver.com
C**************************************************************************************
      SUBROUTINE GAPCON(AK,D,FLOWM,TEMP,PREDEF,TIME,CINAME,SECNAME,
     1 MAINNAME,COORDS,NOEL,NODE,NPRED,KSTEP,KINC)

      INCLUDE 'ABA_PARAM.INC'
      
      CHARACTER*80 CINAME,SECNAME,MAINNAME
      DIMENSION AK(5),D(2),FLOWM(2),TEMP(2),PREDEF(2,*),
     1 TIME(2),COORDS(3)
      
      REAL*16 :: k, t, t_final
      
      ! Set initial value for k
      k = 0.0
      
      ! Check if SECNAME matches 'Surf_Inc'
      IF (SECNAME .EQ. 'SURF_INC') THEN
          
          ! Linearly increase k with time from 0.0 to 3.0
          t_final = 3.0
          t = TIME(1)
          k = 0.01 * (t / t_final)
          
      ELSE
      
          ! Linearly decrease k with time from 3.0 to 0.0
          t_final = 3.0
          t = TIME(1)
          k = 0.000001 * (1 - t / t_final)
          
      END IF
      
      ! Set AK(1) to the computed value of k
      AK(1) = k
      
      ! Set AK(2), AK(3), AK(4), AK(5) to zero
      AK(2) = 0.0
      AK(3) = 0.0
      AK(4) = 0.0
      AK(5) = 0.0
      
      RETURN
      
      END