org 100h
.stack 10


.data 
stringscore db "Moves: "
stringload db "Loading next level" 
stringtotalscore db "Total Moves: "
line db 0     ;cursor position for loop
score dw 0
totalscore dw 0
direction db 0  ;direction of pressed arrow 
finished db 0   ; to check if player crossed finish line
;wall 178
;space 32
;finishline 179
                                                                       
;level 1                                                                k                                                  k                                                            k                                                   k                                                            k                                                                                                                                                     ;                                                             l                                                   ;                                                          l                                                    l                                                            l                                                 l                                                  l
level1 db 178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,32,32,32,32,32,32,32,178,32,32,32,32,32,32,179,178,178,178,178,32,178,178,178,178,32,178,178,178,178,32,179,178,32,32,32,32,178,32,32,32,32,178,32,32,32,32,178,178,32,178,178,178,178,32,178,178,178,178,178,178,178,32,178,178,32,178,32,32,32,32,178,32,178,32,32,32,178,32,178,178,32,178,32,178,178,178,178,32,178,32,178,32,178,32,178,178,32,178,32,178,32,32,32,32,178,32,178,32,178,32,178,178,32,178,32,178,32,178,32,178,178,32,178,32,178,32,178,178,32,178,32,178,32,178,32,178,32,32,178,32,178,32,178,178,32,178,32,178,32,178,32,178,32,178,178,32,178,32,178,178,32,178,32,178,32,178,32,178,32,178,32,32,178,32,178,178,32,178,32,178,178,178,32,178,32,178,32,178,178,32,178,178,32,178,32,32,32,32,32,178,32,178,32,178,32,32,178,178,32,32,32,178,178,178,32,32,32,178,32,178,32,32,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178
;level 2                                                                                                 k                                                                            k                                                                                          l                                                                               k                                                                                            l                                                                             l                                                                                           l                                                                              ;                                                                                            l                                                                             l                                                                                            k                                                                                  
level2 db 178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178 ,178,32,32,32,32,32,32,32,178,32,32,32,178,32,32,32,32,32,32,32,32,32,32,178 ,178,32,178,32,178,178,178,32,178,32,178,32,178,178,178,178,178,178,178,178,32,178,178,178 ,178,,32,178,32,178,32,32,32,32,32,178,32,32,32,32,32,32,32,32,178,32,32,32,178 ,178,32,178,32,178,178,178,178,178,178,178,178,178,178,178,178,178,178,32,178,178,178,32,178 ,178,32,178,32,178,32,32,32,32,32,32,32,32,32,32,32,32,178,32,32,32,32,32,178 ,178,32,178,32,178,32,178,178,178,178,178,32,178,178,178,178,32,178,178,178,178,178,178,178 ,178,32,178,32,32,32,178,32,32,32,32,32,178,32,32,32,32,32,32,32,32,32,32,178 ,178,32,178,178,178,178,178,32,178,178,178,178,178,178,178,178,178,32,178,178,178,178,178,178 ,178,32,32,32,32,32,178,32,178,32,32,32,32,32,32,32,32,32,178,32,32,32,32,178 ,178,178,178,178,178,32,178,32,178,32,178,178,178,178,178,178,178,178,178,32,178,178,178,178  

level2pt2 db 178,32,32,32,32,32,178,32,178,32,178,32,32,32,178,32,32,178,32,32,32,178,32,178,178,32,178,178,178,178,178,32,178,32,32,32,32,32,178,32,178,178,32,178,32,178,32,178 ,178,32,178,32,32,32,178,32,178,178,178,178,178,32,178,32,178,32,32,178,32,178,32,179 ,178,32,32,32,32,32,32,32,32,32,32,32,178,32,32,32,32,32,32,178,32,32,32,179 ,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178
;level 3                                                                                                                                   k                                                                                                       k                                                                                                                     k                                                                                                            l                                                                                                                   k                                                                                                             k                                                                                                                  k                                                                                                              k
level3p1 db 178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178 ,178,32,178,32,32,32,32,178,32,178,32,32,32,32,32,178,32,32,32,32,32,32,32,32,178,32,32,32,32,32,32,178 ,178,32,178,32,178,178,32,178,32,178,32,178,178,178,32,178,32,178,178,178,178,32,178,32,178,32,178,178,178,178,32,178 ,178,32,178,32,32,178,32,178,32,32,32,178,32,178,32,178,32,32,32,32,178,32,178,32,178,32,178,32,32,178,32,178 ,178,32,32,32,32,178,32,178,32,178,178,178,32,178,32,178,178,178,178,178,178,32,178,32,32,32,178,32,178,178,32,178 ,178,32,178,32,32,178,32,32,32,32,32,32,32,178,32,32,32,32,32,178,32,32,178,178,178,32,178,32,32,32,32,178 ,178,32,178,178,32,178,178,178,178,178,178,32,32,178,32,32,32,178,32,178,32,32,32,32,178,32,178,178,178,32,178,178 ,179,32,32,178,32,178,32,32,32,32,178,178,178,178,178,178,178,178,32,178,32,178,178,32,178,32,32,32,178,32,32,178
;                                                                                                                     l                                                                                                                      k                                                                                                             k                                                                                                                   k                                                                                                            k                                                                                                                       k                                                                                                                                                                                                                                     ;
level3p2 db 179,32,32,178,32,178,32,32,32,32,32,32,32,32,32,32,32,32,32,178,32,32,178,32,178,178,178,32,178,32,178,178 ,178,178,178,178,178,178,32,178,178,178,178,178,178,178,32,178,178,178,178,178,178,32,178,32,32,32,178,32,32,32,32,178 ,178,32,32,32,32,178,32,178,32,32,32,32,32,178,32,32,32,32,32,178,32,32,178,32,178,178,178,178,178,178,32,178 ,178,32,178,178,178,178,32,178,32,178,178,178,32,178,32,178,178,178,32,178,32,178,178,32,178,32,32,32,32,178,32,178 ,178,32,178,32,32,32,32,178,32,178,32,32,32,178,32,32,178,32,32,178,32,178,32,32,178,178,32,178,32,32,32,178 ,178,32,178,32,178,178,178,178,32,178,32,178,178,178,178,32,178,32,178,178,32,178,32,178,178,178,32,178,178,178,178,178 ,178,32,32,32,32,32,32,32,32,178,32,32,32,32,32,32,178,32,32,32,32,178,32,32,32,32,32,32,32,32,32,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178,178

.code
mov ax,@data
mov ds,ax


call maze1         ;Level 1 maze creation

game1:
call playerinput   ;waits for player to click on arrow button   
call moveplayer    ;moves the player

cmp finished,1     ;check if player reached finish line
je exit1

jmp game1

exit1:


call displayscore     ;displays score 
call printloadstring
mov ax,score
add totalscore,ax     ;saves total score
mov score,0
mov finished,0
call clearscreen16       ;clears screen for the first level 


;--------------Move cursor to top of screen before loading level---------------
mov ah,2
mov dh,0
mov dl,0
mov bh,0
int 10h 
;----------------------------------------------------------


call maze2 ;Level 2 maze creation

game2:
call playerinput   ;waits for player to click on arrow button   
call moveplayer    ;moves the player


                   ;check if player reached finish line
cmp finished,1
je exit2

jmp game2

exit2:

call displayscore  ;displays score
mov ax,score
add totalscore,ax  ;saves total score
mov score,0  
mov finished,0
call printloadstring
call clearscreen   ;clears screen


;--------------Move cursor to top of screen before loading level---------------
mov ah,2
mov dh,0
mov dl,0
mov bh,0
int 10h 
;----------------------------------------------------------


call maze3 ;Level 3 maze creation

game3:
call playerinput   ;waits for player to click on arrow button   
call moveplayer    ;moves the player

cmp finished,1     ;check if player reached finish line
je exit3

jmp game3

exit3:


call displayscore     ;displays score 
mov ax,score
add totalscore,ax     ;saves total score

call printtotalscore



ret


maze1 proc ;---------------------------- Create Maze Level 1 ----------------------------
;Creating the maze



mov cx,16  ;outer loop
mov si,0
outerloop1:
push cx

mov cx,16
 

innerloop1:

mov ah,2
mov dl,level1[si]
int 21h
inc si
    
loop innerloop1 
   
call nextline  ;put cursor on next line    
pop cx   

loop outerloop1

;--------------Move cursor to start position---------------
mov ah,2
mov dh,14
mov dl,1
mov bh,0
int 10h  

mov ah,0Ah ;write player at cursor position
mov al,219
mov bh,0
mov cx,1
int 10h

;----------------------------------------------------------




mov line,0 
ret
maze1 endp 
        
        
        
        
maze2 proc  ;-------------------------Creats Level 2-----------------------
   
    
;Creating the maze

mov cx,16  ;outer loop  //height
mov si,0
outerloop4:
push cx

mov cx,24 ;width
 

innerloop4: 

mov ah,2
mov dl,level2[si]
int 21h
inc si
    
loop innerloop4 
   
call nextline  ;put cursor on next line    
pop cx   

loop outerloop4

;--------------Move cursor to start position---------------
mov ah,2
mov dh,1
mov dl,1
mov bh,0
int 10h  

mov ah,0Ah ;write player at cursor position
mov al,219
mov bh,0
mov cx,1
int 10h

;----------------------------------------------------------




mov line,0     
    
ret
maze2 endp
   
   
   
   
   
maze3 proc  ;-------------------------Creats Level 3-----------------------
  
    
;Creating the maze

mov cx,16  ;outer loop  //height
mov si,0
outerloop3:
push cx

mov cx,32 ;width
 

innerloop3:

mov ah,2
mov dl,level3p1[si]
int 21h
inc si
    
loop innerloop3 
   
call nextline  ;put cursor on next line    
pop cx   

loop outerloop3

;--------------Move cursor to start position---------------
mov ah,2
mov dh,7
mov dl,30
mov bh,0
int 10h  

mov ah,0Ah ;write player at cursor position
mov al,219
mov bh,0
mov cx,1
int 10h

;----------------------------------------------------------




mov line,0     
    
ret
maze3 endp

  
  
  
nextline proc  ;------------------------ set cursor to next line --------------------------
inc line    
mov ah,2
mov dh,line
mov dl,0
mov bh,0
int 10h 

   
    
ret
nextline endp



playerinput proc ;--------checks which arrow was click------------

mov ah,00h ;checks for keystroke (from documentation)
int 16h
        
        
cmp ah,4Dh     ;check if right arrow was pressed
jne f1
mov direction,"r" 
inc score
jmp next 

f1:
cmp ah,4Bh     ;check if left arrow was pressed
jne f2
mov direction,"l" 
inc score
jmp next

f2:

cmp ah,48h     ;check if up arrow was pressed
jne f3
mov direction,"u"
inc score
jmp next

f3:

cmp ah,50h     ;check if down arrow was pressed
jne next
mov direction,"d" 
inc score


next:    
ret
playerinput endp 





moveplayer proc ;-----checks for the what arrow was clicked and changes cursor position based on that-----
 
 
 
cmp direction,"r" ;if player pressed right arrow
jne d1     


;------------------read the character in the directon of the player(wall/finishline)---------------
                                                                                                 ;-
                                                                                                 ;-
mov ah,03h ;get current position of the cursor                                                   ;-
mov bh,0                                                                                         ;-
int 10h                                                                                          ;-
                                                                                                 ;-
                                                                                                 ;-
mov ah,2   ;set position of the cursor to current position + 1 step to the right                 ;-
inc dl                                                                                           ;-
int 10h                                                                                          ;-
                                                                                                 ;-
                                                                                                 ;-
mov ah,08h ;read character at current position                                                   ;-
mov bh,0                                                                                         ;-
int 10h                                                                                          ;-       ;-                                                                                                
                                                                                                 ;-
;--------------------------------------------------------------------------------------------------


cmp al,178 ;if its a wall
jne L1

mov ah,2   ;set cursor position back to original position                
dec dl                                                                                           
int 10h

jmp next3


L1:
cmp al,32 ;if its a space
jne L2

mov ah,2   ;set cursor position back to original position                
dec dl                                                                                           
int 10h

mov ah,0Ah ;write space at cursor position
mov al,32
mov bh,0
mov cx,1
int 10h

mov ah,2   ;set position of the cursor to current position + 1 step to the right                 
inc dl                                                                                           
int 10h

mov ah,0Ah ;write player at cursor position
mov al,219
mov bh,0
mov cx,1
int 10h




jmp next3



L2:
cmp al,179 ;if its the finish line
jne next3

mov finished,1 

jmp next3



d1:

cmp direction,"l"  
jne d2

;------------------read the character in the directon of the player(wall/finishline)---------------
                                                                                                 ;-
                                                                                                 ;-
mov ah,03h ;get current position of the cursor                                                   ;-
mov bh,0                                                                                         ;-
int 10h                                                                                          ;-
                                                                                                 ;-
                                                                                                 ;-
mov ah,2   ;set position of the cursor to current position + 1 step to the left                  ;-
dec dl                                                                                           ;-
int 10h                                                                                          ;-
                                                                                                 ;-
                                                                                                 ;-
mov ah,08h ;read character at current position                                                   ;-
mov bh,0                                                                                         ;-
int 10h                                                                                          ;-       ;-                                                                                                
                                                                                                 ;-
;--------------------------------------------------------------------------------------------------


cmp al,178 ;if its a wall
jne La1

mov ah,2   ;set cursor position back to original position                
inc dl                                                                                           
int 10h

jmp next3


La1:
cmp al,32 ;if its a space
jne La2

mov ah,2   ;set cursor position back to original position                
inc dl                                                                                           
int 10h
 
mov ah,0Ah ;write space at cursor position
mov al,32
mov bh,0
mov cx,1
int 10h
 
mov ah,2   ;set position of the cursor to current position + 1 step to the left                 
dec dl                                                                                           
int 10h

mov ah,0Ah ;write player at cursor position
mov al,219
mov bh,0
mov cx,1
int 10h
 
 



jmp next3



La2:
cmp al,179 ;if its the finish line
jne next3

mov finished,1 

jmp next3


 
  

d2:

cmp direction,"u"  
jne d3

;------------------read the character in the directon of the player(wall/finishline)---------------
                                                                                                 ;-
                                                                                                 ;-
mov ah,03h ;get current position of the cursor                                                   ;-
mov bh,0                                                                                         ;-
int 10h                                                                                          ;-
                                                                                                 ;-
                                                                                                 ;-
mov ah,2   ;set position of the cursor to current position + 1 step upwards                      ;-
dec dh                                                                                           ;-
int 10h                                                                                          ;-
                                                                                                 ;-
                                                                                                 ;-
mov ah,08h ;read character at current position                                                   ;-
mov bh,0                                                                                         ;-
int 10h                                                                                          ;-       ;-                                                                                                
                                                                                                 ;-
;--------------------------------------------------------------------------------------------------


cmp al,178 ;if its a wall
jne Lb1

mov ah,2   ;set cursor position back to original position                
inc dh                                                                                           
int 10h
        
jmp next3

 
Lb1:
cmp al,32 ;if its a space
jne Lb2

mov ah,2   ;set cursor position back to original position                
inc dh                                                                                          
int 10h

mov ah,0Ah ;write space at cursor position
mov al,32
mov bh,0
mov cx,1
int 10h

mov ah,2   ;set position of the cursor to current position + 1 step upwards                 
dec dh                                                                                           
int 10h

mov ah,0Ah ;write player at cursor position
mov al,219
mov bh,0
mov cx,1
int 10h
 

 





jmp next3



Lb2:
cmp al,179 ;if its the finish line
jne next3

mov finished,1 

jmp next3

d3:

cmp direction,"d"  
jne next3
     
        
;------------------read the character in the directon of the player(wall/finishline)---------------
                                                                                                 ;-
                                                                                                 ;-
mov ah,03h ;get current position of the cursor                                                   ;-
mov bh,0                                                                                         ;-
int 10h                                                                                          ;-
                                                                                                 ;-
                                                                                                 ;-
mov ah,2   ;set position of the cursor to current position + 1 step downwards                    ;-
inc dh                                                                                           ;-
int 10h                                                                                          ;-
                                                                                                 ;-
                                                                                                 ;-
mov ah,08h ;read character at current position                                                   ;-
mov bh,0                                                                                         ;-
int 10h                                                                                          ;-       ;-                                                                                                
                                                                                                 ;-
;--------------------------------------------------------------------------------------------------


cmp al,178 ;if its a wall
jne Lc1

mov ah,2   ;set cursor position back to original position                
dec dh                                                                                           
int 10h

jmp next3


Lc1:
cmp al,32 ;if its a space
jne Lc2

mov ah,2   ;set cursor position back to original position                
dec dh                                                                                          
int 10h
 
mov ah,0Ah ;write space at cursor position
mov al,32
mov bh,0
mov cx,1
int 10h 
 
mov ah,2   ;set position of the cursor to current position + 1 step downwards                 
inc dh                                                                                           
int 10h

mov ah,0Ah ;write player at cursor position
mov al,219
mov bh,0
mov cx,1
int 10h
 
 



jmp next3



Lc2:
cmp al,179 ;if its the finish line
jne next3

mov finished,1 
 
     
next3:        
ret
moveplayer endp  
                
                
                

displayscore proc ;----------------------------Display Score after completion----------------------


mov ah,2
mov dh,16
mov dl,0
mov bh,0
int 10h


    
mov cx,7    
mov si,0 
    
dsloop:
mov ah,2
mov dl,stringscore[si]
int 21h
inc si
loop dsloop    

cmp score,99
jg mthan
    
mov ax,score
mov bl,10
div bl

mov cx,ax
add cl,30h
add ch,30h

mov ah,2
mov dl,cl
int 21h

mov ah,2
mov dl,ch
int 21h

jmp return


mthan:        ;divide the score twice to print it

mov ax,score
mov bl,10
div bl

mov dh,ah
add dh,30h

mov ah,0
mov bl,10
div bl

mov cx,ax
add ch,30h
add cl,30h

mov ah,2
mov dl,cl
int 21h

mov ah,2
mov dl,ch
int 21h

mov ah,2
mov dl,dh
int 21h



return:

    
ret
displayscore endp


clearscreen proc;------------------------This functions clears the score and level load string-------------------------------------
    
mov ah,2
mov dh,0
mov dl,0
mov bh,0
int 10h    


mov cx,18  ;outer loop
outerloop2:
push cx

mov cx,32
 

innerloop2:

mov ah,2
mov dl,32
int 21h
    
loop innerloop2 
   
call nextline  ;put cursor on next line    
pop cx   

loop outerloop2    
    
mov line,0    
ret
clearscreen endp

clearscreen16 proc;------------------------Clears screen For the first level to save time-------------------------------------
    
mov ah,2
mov dh,0
mov dl,0
mov bh,0
int 10h    


mov cx,18  ;outer loop
outerloopc:
push cx

mov cx,18
 

innerloopc:

mov ah,2
mov dl,32
int 21h
    
loop innerloopc 
   
call nextline  ;put cursor on next line    
pop cx   

loop outerloopc    


mov line,0    
    
ret
clearscreen16 endp  
 

printloadstring proc;------------------------Print "loading next level" to console---------------------------
mov ah,2
mov dh,17
mov dl,0
mov bh,0
int 10h



mov cx,18    
mov si,0 
    
dlloop:
mov ah,2
mov dl,stringload[si]
int 21h
inc si
loop dlloop     
       
ret
printloadstring endp




printtotalscore proc;---------------------------Print The total score of the game------------------------
mov ah,2
mov dh,17
mov dl,0
mov bh,0
int 10h




mov cx,13    
mov si,0 
    
dtloop:
mov ah,2
mov dl,stringtotalscore[si]
int 21h
inc si
loop dtloop 
             
             
             
             
             
             
mov ax,totalscore  ;divide the score twice to print it
mov bl,10
div bl

mov dh,ah
add dh,30h

mov ah,0
mov bl,10
div bl

mov cx,ax
add ch,30h
add cl,30h

mov ah,2
mov dl,cl
int 21h

mov ah,2
mov dl,ch
int 21h

mov ah,2
mov dl,dh
int 21h
       


ret
printtotalscore endp