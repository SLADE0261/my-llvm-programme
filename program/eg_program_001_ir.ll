; ModuleID = 'eg_program_001.c'
source_filename = "eg_program_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @calculate(i32 noundef %num1, i32 noundef %num2) #0 {
entry:
  %num1.addr = alloca i32, align 4
  %num2.addr = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %num1, ptr %num1.addr, align 4
  store i32 %num2, ptr %num2.addr, align 4
  %0 = load i32, ptr %num1.addr, align 4
  %1 = load i32, ptr %num2.addr, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, ptr %res, align 4
  %2 = load i32, ptr %res, align 4
  ret i32 %2
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 24.0.0git (https://github.com/llvm/llvm-project.git 2c17d4dc2ef1fd925c8ee7cf71991fe9e14d970d)"}
