include \masm32\include\masm32rt.inc

.data
a db "hello",0
b db "*",0
.code
strset proc
push ebp
mov ebp, esp
mov edi, [ebp+8]     
mov edx, edi         
push edi             
call strlen          
add esp, 4           
mov ecx, eax         
mov al, [ebp+12]      
mov edi, edx        
rep stosb            
mov eax, edx        
mov esp, ebp
pop ebp
ret

strlen:
push ebp
mov ebp, esp
mov edi, [ebp+8]     
mov edx, edi         
xor eax, eax        
mov ecx, -1          
repne scasb          
sub edi, edx         
dec edi             
mov eax, edi        
mov esp, ebp
pop ebp
ret
strset endp
main:
movzx eax,b 
push eax
push offset a 
call strset 
print offset a
exit
end main 