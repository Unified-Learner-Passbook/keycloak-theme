<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>
    <#elseif section = "form">
        <div>
            <center>
                <img class="leftlogo" src="${url.resourcesPath}/img/logo.png" alt="ULP in UP">
                <br>
                <br>
                <img class="textlogo" src="${url.resourcesPath}/img/wallet_logo.png" alt="ULP Text">
            </center>
            <br>
            <br>
        </div>
        <div class="box-container user_div">
        <#if realm.password>
            <div class="form_div">
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                    <font class="input_text">Username</font>
                    <br/>
                    <input id="username" class="custom-input-field" placeholder="${msg("username")}" type="text" name="username" tabindex="1">
                    <br/>
                    <br/>
                    <font class="input_text">Password</font>
                    <br/>
                    <input id="password" class="custom-input-field" placeholder="${msg("password")}" type="password" name="password" tabindex="2">
                    <label class="visibility pass_label" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png" class="pass_icon"></label>
                    <br/>
                    <br/>
                    <br/>
                    <input class="digilocker-button-style" type="submit" value="${msg("doLogIn")}" tabindex="3">
                </form>
            </div>
        </#if>
        <#if social.providers??>
            <center><div class="form_div">
                <font class="input_text">or</font>
                <#list social.providers as p>
                <input class="digilocker-button-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div></center>
        </#if>
        </div>
    </#if>
</@layout.registrationLayout>
