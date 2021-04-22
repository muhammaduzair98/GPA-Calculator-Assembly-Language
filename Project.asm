include Irvine32.inc
include macros.inc


.data

	msg0 byte "Enter how many course you have taken",0
	msg1 byte "Enter the Credit Hours",0
	msg2 byte "Enter the Points",0
	credit dword 7 dup(0)
	point dword 7 dup(0)	
	courses dword 0
	sum_of_points dword 0
	cal1 dword 0 



.code

	main Proc
;----------------------------------------------------------
;LAYOUT
		call clrscr
		mGotoxy 30,9
		mWrite "GPA Calculator"
		mGotoxy 30,10
		mWrite "Presented by M.Uzair Fahim & Muhammad Uzair"
		mGotoxy 30,12
		mWrite "17P-6055, 16P-6002 "
		call WaitMsg
		call clrscr
		
		mWrite "Fun Begins Now"
		call crlf
;---------------------------------------------------------------------
;Select Courses
		
		mov edx , OFFSET msg0
		call writestring
		call crlf
		call readint
		mov courses,eax

;----------------------------------------------------------------------
;code for taking credit hours from user

		mwrite "Enter Credit Hours"		
		call crlf

		mov esi , 0
		mov ecx , eax
		l1:
			call readint
			mov credit[esi],eax
			add esi , 4			
	
		loop l1			

;---------------------------------------------------------------------
;code for taking points from user

		mwrite "Enter Points"		
		call crlf

		mov esi , 0
		mov ecx , courses
		l2:
			call readfloat
			mov point[esi],eax
			add esi , 4			
			add sum_of_points , eax			
		
		loop l2		
;---------------------------------------------------------------------
;calculation
		mov esi , 0
		mov ecx , courses
		l3:
			mov edx	, 0
			mov eax , point[esi]
			mov ebx , credit[esi]
			mul eax , ebx
			add cal1 , eax 

		loop l3		
	
	mov eax , cal1
	call writedec

	div cal1
		
	exit
	main ENDP
	End main
	