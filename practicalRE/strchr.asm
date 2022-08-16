include \masm32\include\masm32rt.inc

.data
 a db "bgt",0
 b db "g",0
.code

strchr proc
push ebp
mov ebp, esp
mov edi, [ebp+8]     ; get first parameter
mov bl, [ebp+12]     ; set bl to second parameter
mov al, 0            ; set al to null byte
_loop:
mov cl, [edi]        ; store current character
cmp cl, bl           ; check if character is what we search         
jz _return           ; jump to return if match
scasb                ; check if null byte
jnz _loop            ; loop if no match
mov edi, 0           ; set edi to zero, so function will return null
_return:
mov eax, edi         ; return pointer to first occurence 
mov esp, ebp
pop ebp
ret
strchr endp

main:

call strchr
exit 

end main