define dso_local i32 @calculate01(i32 noundef %num1, i32 noundef %num2) #0
{
    entry:
        %num1.addr = alloca i32, align 4
        %num2.addr = alloca i32, align 4
        %result = alloca i32, align 4
        store i32 %num1, ptr %num1.addr, align 4
        store i32 %num2, ptr %num2.addr, align 4
        %0 = load i32, ptr %num1.addr, align 4
        %1 = load i32, ptr %num2.addr, align 4
        %add = add nsw i32 %0, %1
        store i32 %add, ptr %result, align 4
        %2 = load i32, ptr %result, align 4
        ret i32 %2
}

define dso_local i32 @calculate(i32 noundef %num1, i32 noundef %num2) #0
{
    entry:
        %add = add nsw i32 %num1, %num2
        ret i32 %add
}

define dso_local i32 @calculate2(i32 noundef %num1, i32 noundef %num2) #0
{
entry:
    %add = add nsw i32 %num1, %num2
    br label %block2

block2:
    %sub = sub nsw i32 %num1, %num2
    br label %block3

block3:
    %result = add nsw i32 %add, %sub
    ret i32 %result
}