include \masm32\include\masm32rt.inc 

.data
a db "hello",0
b db "hello",0
.code
strcmp proc
push ebp
mov ebp,esp
mov eax,[ebp+8]
push eax
call strlen
add esp,4
mov ebx,eax
mov eax,[ebp+12]
push eax
call strlen
add esp,4
cmp ebx,eax
jnz fail
jz sameSize
mov esp,ebp
pop ebp
ret
sameSize:
mov edi, [ebp+12]
mov esi, [ebp+8]
mov ecx,eax
repe cmpsb
jne fail
jmp win
mov esp,ebp
pop ebp
ret
strlen:
push ebp
mov ebp,esp
mov edi,[ebp+8]
mov esi,edi
mov eax,0
mov ecx,-1
repne scasb
sub edi,esi
dec edi
mov eax,edi
mov esp,ebp
pop ebp
ret
fail:
print chr$("khong giong nhau")
mov esp,ebp
pop ebp
ret
win:
print chr$("giong nhau")
mov esp,ebp
pop ebp
ret
strcmp endp
main:
push offset b
push offset a
call strcmp
exit
end main