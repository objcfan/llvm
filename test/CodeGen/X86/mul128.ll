; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown | FileCheck %s --check-prefix=X64

define i128 @foo(i128 %t, i128 %u) {
; X64-LABEL: foo:
; X64:       # BB#0:
; X64-NEXT:    movq %rdx, %r8
; X64-NEXT:    imulq %rdi, %rcx
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    mulq %rdx
; X64-NEXT:    addq %rcx, %rdx
; X64-NEXT:    imulq %r8, %rsi
; X64-NEXT:    addq %rsi, %rdx
; X64-NEXT:    retq
  %k = mul i128 %t, %u
  ret i128 %k
}
