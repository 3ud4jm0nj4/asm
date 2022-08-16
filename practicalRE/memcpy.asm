include \masm32\include\masm32rt.inc

.data

a db "xinchao",0
b db "bye",0
n dd 2
.code


memcpy proc
push ebp
mov ebp, esp
mov esi, [ebp+8]       
mov edi, [ebp+12]      
mov ecx, [ebp+16]    
_loop:
mov al, [esi];   
   
mov [edi], al;      
inc esi              
inc edi              
dec ecx              
jnz _loop  
mov esp, ebp
pop ebp
memcpy endp 

main:
push n
push offset b
push offset a
call memcpy
exit
end main