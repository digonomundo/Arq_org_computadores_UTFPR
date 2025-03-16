main:
  addi $s0, $0, 4
  jal somavet
  addi $v0, $0, 10
  syscall

somavet: 
  addi $sp, $sp, -8 #aloca 8 bytes na pilha
  sw $s0, 0($sp) #salva s0 no topo
  sw $s1, 4($sp) #salva s1 em topo+4
  add $s0, $0, $0 #ac=0
  add $s1, $0, $0 #i=0
  for:slt $t0, $s1, $a1 #t0 = i<n
    beq $t0, $0, exit #se i>=n exit
    sll $t1, $s1, 2 #t1 = i*4
    add $t2, $t1, $a0 # t2 = &vet[i]
    lw $t3, 0($t2) #t3 = vet[i]
    add $s0, $s0, $t3 # ac += vet[i]
    addi $s1, $s1, 1 #i++
    j for
  exit: add $v0, $s0, $0 #retorne ac
  lw $s0, 0($sp) #restaura s0
  lw $s1, 4($sp) #restaura s1
  addi $sp, $sp, 8 #desaloca pilha
  jr $ra #volta ao caller