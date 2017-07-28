

function callPicker()
{
    // 通过共同定义的testobject调OC方法
    object.callPicker();
}

function callPay()
{
    object.callPay();
}

function callPassParameter()
{
    // 调OC方法 传递一个参数
    object.callPassParameter("5201314");
}

function callParameteroneAndParametertwo()
{
    // 调OC方法 传递两个参数
    object.callTestParameteroneAndParametertwo("5201314","GHZ");
}
