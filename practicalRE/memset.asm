include \masm32\include\masm32rt.inc

.data
a db "hello",0
b db "t",0
n dd 3
.code
memset proc
push ebp
mov ebp,esp
mov edi,[ebp+8]
mov bl,[ebp+12]
mov ecx,[ebp+16]
rep stosb
mov ebp,esp
pop ebp
ret 
memset endp
main:
push n
movzx eax,b
push eax
push offset a 
call memset
print offset a
exit
end main