include \masm32\include\masm32rt.inc


.data
    a db "gooodbye",0
.code
strlen proc
push ebp
mov ebp, esp
mov edi, [ebp+8]     ; lay ki tu dau tien trong chuoi
mov edx, edi         ; copy dia chi phan tu dau tien cua chuoi
xor eax, eax         ; dat eax = null 
mov ecx, -1          ; dat ecx de cho ecx khong bi tro thanh 0 
repne scasb          ; ham scas so sanh eax va edi neu bang nhau thi dung lai
                     ;edi lan luot tang len den khi = null( ecx = ecx -1)
sub edi, edx         ; substract start address from end address 
dec edi              ; decrement difference to compensate for null byte
mov eax, edi         ; return strlen result
print str$(eax)
mov esp, ebp
pop ebp
ret
strlen endp

main:

push offset a 
call strlen
push offset a
int 21h 
exit
end main