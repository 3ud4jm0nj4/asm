include \masm32\include\masm32rt.inc

.data
 a db "xinchao",0
 b db "c",0
.code

strchr proc
push ebp
mov ebp, esp
mov edi, [ebp+8]   ;lay ki tu dau tien cua chuoi
mov esi,edi         ;luu vi tri dau tien cua chuoi
mov bl, [ebp+12]     ;lay ki tu can so sanh "b"
mov al, 0            
_loop:
mov cl, [edi]        
cmp cl, bl                    
jz _return           
scasb                
jnz _loop                      
_return:
add edi,1
sub edi,esi
print str$(edi)
mov eax, edi          
mov esp, ebp
pop ebp
ret
strchr endp

main:
movzx eax,b ;chuyen ki tu vao thanh ghi movzx chuyen 8 bit vao 32 bit
push eax    
push offset a
call strchr
exit 

end main