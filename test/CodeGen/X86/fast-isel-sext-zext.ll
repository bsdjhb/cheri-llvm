; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-apple-darwin10 -fast-isel -fast-isel-abort=1 | FileCheck %s --check-prefix=X32
; RUN: llc < %s -mtriple=x86_64-apple-darwin10 -fast-isel -fast-isel-abort=1 | FileCheck %s --check-prefix=X64

define i8 @test1(i8 %x) nounwind {
; X32-LABEL: test1:
; X32:       ## BB#0:
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    andb $1, %al
; X32-NEXT:    negb %al
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test1:
; X64:       ## BB#0:
; X64-NEXT:    andb $1, %dil
; X64-NEXT:    negb %dil
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %z = trunc i8 %x to i1
  %u = sext i1 %z to i8
  ret i8 %u
}

define i16 @test2(i16 %x) nounwind {
; X32-LABEL: test2:
; X32:       ## BB#0:
; X32-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    andb $1, %al
; X32-NEXT:    negb %al
; X32-NEXT:    movsbl %al, %eax
; X32-NEXT:    ## kill: %ax<def> %ax<kill> %eax<kill>
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test2:
; X64:       ## BB#0:
; X64-NEXT:    andb $1, %dil
; X64-NEXT:    negb %dil
; X64-NEXT:    movsbl %dil, %eax
; X64-NEXT:    ## kill: %ax<def> %ax<kill> %eax<kill>
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %z = trunc i16 %x to i1
  %u = sext i1 %z to i16
  ret i16 %u
}

define i32 @test3(i32 %x) nounwind {
; X32-LABEL: test3:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    andb $1, %al
; X32-NEXT:    negb %al
; X32-NEXT:    movsbl %al, %eax
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test3:
; X64:       ## BB#0:
; X64-NEXT:    andb $1, %dil
; X64-NEXT:    negb %dil
; X64-NEXT:    movsbl %dil, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %z = trunc i32 %x to i1
  %u = sext i1 %z to i32
  ret i32 %u
}

define i32 @test4(i32 %x) nounwind {
; X32-LABEL: test4:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    andb $1, %al
; X32-NEXT:    negb %al
; X32-NEXT:    movsbl %al, %eax
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test4:
; X64:       ## BB#0:
; X64-NEXT:    andb $1, %dil
; X64-NEXT:    negb %dil
; X64-NEXT:    movsbl %dil, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %z = trunc i32 %x to i1
  %u = sext i1 %z to i32
  ret i32 %u
}

define i8 @test5(i8 %x) nounwind {
; X32-LABEL: test5:
; X32:       ## BB#0:
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    andb $1, %al
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test5:
; X64:       ## BB#0:
; X64-NEXT:    andb $1, %dil
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %z = trunc i8 %x to i1
  %u = zext i1 %z to i8
  ret i8 %u
}

define i16 @test6(i16 %x) nounwind {
; X32-LABEL: test6:
; X32:       ## BB#0:
; X32-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    andb $1, %al
; X32-NEXT:    movzbl %al, %eax
; X32-NEXT:    ## kill: %ax<def> %ax<kill> %eax<kill>
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test6:
; X64:       ## BB#0:
; X64-NEXT:    andb $1, %dil
; X64-NEXT:    movzbl %dil, %eax
; X64-NEXT:    ## kill: %ax<def> %ax<kill> %eax<kill>
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %z = trunc i16 %x to i1
  %u = zext i1 %z to i16
  ret i16 %u
}

define i32 @test7(i32 %x) nounwind {
; X32-LABEL: test7:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    andb $1, %al
; X32-NEXT:    movzbl %al, %eax
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test7:
; X64:       ## BB#0:
; X64-NEXT:    andb $1, %dil
; X64-NEXT:    movzbl %dil, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %z = trunc i32 %x to i1
  %u = zext i1 %z to i32
  ret i32 %u
}

define i32 @test8(i32 %x) nounwind {
; X32-LABEL: test8:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    andb $1, %al
; X32-NEXT:    movzbl %al, %eax
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test8:
; X64:       ## BB#0:
; X64-NEXT:    andb $1, %dil
; X64-NEXT:    movzbl %dil, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %z = trunc i32 %x to i1
  %u = zext i1 %z to i32
  ret i32 %u
}

define i16 @test9(i8 %x) nounwind {
; X32-LABEL: test9:
; X32:       ## BB#0:
; X32-NEXT:    movsbl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    ## kill: %ax<def> %ax<kill> %eax<kill>
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test9:
; X64:       ## BB#0:
; X64-NEXT:    movsbl %dil, %eax
; X64-NEXT:    ## kill: %ax<def> %ax<kill> %eax<kill>
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = sext i8 %x to i16
  ret i16 %u
}

define i32 @test10(i8 %x) nounwind {
; X32-LABEL: test10:
; X32:       ## BB#0:
; X32-NEXT:    movsbl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test10:
; X64:       ## BB#0:
; X64-NEXT:    movsbl %dil, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = sext i8 %x to i32
  ret i32 %u
}

define i64 @test11(i8 %x) nounwind {
; X32-LABEL: test11:
; X32:       ## BB#0:
; X32-NEXT:    movsbl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl %eax, %edx
; X32-NEXT:    sarl $31, %edx
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test11:
; X64:       ## BB#0:
; X64-NEXT:    movsbq %dil, %rax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = sext i8 %x to i64
  ret i64 %u
}

define i16 @test12(i8 %x) nounwind {
; X32-LABEL: test12:
; X32:       ## BB#0:
; X32-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    ## kill: %ax<def> %ax<kill> %eax<kill>
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test12:
; X64:       ## BB#0:
; X64-NEXT:    movzbl %dil, %eax
; X64-NEXT:    ## kill: %ax<def> %ax<kill> %eax<kill>
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = zext i8 %x to i16
  ret i16 %u
}

define i32 @test13(i8 %x) nounwind {
; X32-LABEL: test13:
; X32:       ## BB#0:
; X32-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test13:
; X64:       ## BB#0:
; X64-NEXT:    movzbl %dil, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = zext i8 %x to i32
  ret i32 %u
}

define i64 @test14(i8 %x) nounwind {
; X32-LABEL: test14:
; X32:       ## BB#0:
; X32-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    xorl %edx, %edx
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test14:
; X64:       ## BB#0:
; X64-NEXT:    movzbl %dil, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = zext i8 %x to i64
  ret i64 %u
}

define i32 @test15(i16 %x) nounwind {
; X32-LABEL: test15:
; X32:       ## BB#0:
; X32-NEXT:    movswl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test15:
; X64:       ## BB#0:
; X64-NEXT:    movswl %di, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = sext i16 %x to i32
  ret i32 %u
}

define i64 @test16(i16 %x) nounwind {
; X32-LABEL: test16:
; X32:       ## BB#0:
; X32-NEXT:    movswl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl %eax, %edx
; X32-NEXT:    sarl $31, %edx
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test16:
; X64:       ## BB#0:
; X64-NEXT:    movswq %di, %rax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = sext i16 %x to i64
  ret i64 %u
}

define i32 @test17(i16 %x) nounwind {
; X32-LABEL: test17:
; X32:       ## BB#0:
; X32-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test17:
; X64:       ## BB#0:
; X64-NEXT:    movzwl %di, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = zext i16 %x to i32
  ret i32 %u
}

define i64 @test18(i16 %x) nounwind {
; X32-LABEL: test18:
; X32:       ## BB#0:
; X32-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    xorl %edx, %edx
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test18:
; X64:       ## BB#0:
; X64-NEXT:    movzwl %di, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = zext i16 %x to i64
  ret i64 %u
}

define i64 @test19(i32 %x) nounwind {
; X32-LABEL: test19:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl %eax, %edx
; X32-NEXT:    sarl $31, %edx
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test19:
; X64:       ## BB#0:
; X64-NEXT:    movslq %edi, %rax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = sext i32 %x to i64
  ret i64 %u
}

define i64 @test20(i32 %x) nounwind {
; X32-LABEL: test20:
; X32:       ## BB#0:
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    xorl %edx, %edx
; X32-NEXT:    retl
; X32-NEXT:    ## -- End function
;
; X64-LABEL: test20:
; X64:       ## BB#0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
; X64-NEXT:    ## -- End function
  %u = zext i32 %x to i64
  ret i64 %u
}
