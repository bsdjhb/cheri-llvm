; RUN: llvm-as %s -data-layout=P201 -o /dev/null
; RUN: not llvm-as %s -o /dev/null 2>&1 | FileCheck %s

; Check that variables in a nonzero program address space 201 can be used in a invoke instruction

define i8 @test_invoke(i8(i32)* %fnptr0, i8(i32) addrspace(201)* %fnptr201) personality i32 (...)* @__gxx_personality_v0 {
  %first = invoke i8 %fnptr0(i32 0) to label %ok unwind label %lpad ; this is fine
  %second = invoke i8 %fnptr201(i32 0) to label %ok unwind label %lpad ; this is also fine if it's the program AS
  ; CHECK: invoke-nonzero-program-addrspace.ll:[[@LINE-1]]:23: error: '%fnptr201' defined with type 'i8 (i32) addrspace(201)*'
ok:
  ret i8 0
lpad:
    %exn = landingpad {i8*, i32}
            cleanup
    unreachable
}

declare i32 @__gxx_personality_v0(...)
