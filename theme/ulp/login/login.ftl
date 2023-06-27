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
            <img class="leftlogo" src="${url.resourcesPath}/img/logo.png" alt="ULP in UP">
            <br>
            <br>
            <br>
            <br>
            <center>
                <img class="textlogo" src="${url.resourcesPath}/img/text.png" alt="ULP Text">
            </center>
            <br>
            <br>
            <br>
            <br>
            <center>
                <img class="userlogo" src="${url.resourcesPath}/img/userlogo.png" alt="ULP Text">
            </center>
            <br>
        </div>
        <div class="box-container">
        <!--<#if realm.password>
            <center><div class="form_div">
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                    <input id="username" class="custom-input-field" placeholder="${msg("username")}" type="text" name="username" tabindex="1">
                    <div>
                        <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                    </div>
                <input id="password" class="custom-input-field" placeholder="${msg("password")}" type="password" name="password" tabindex="2">
                <input class="submit" type="submit" value="${msg("doLogIn")}" tabindex="3">
                </form>
            </div></center>
        </#if>-->
        <#if social.providers??>
            <!--<p class="para">${msg("selectAlternative")}</p>-->
            <center><div id="social-providers">
                <#list social.providers as p>
                <input class="digilocker-button-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div></center>
        </#if>
        </div>
    </#if>
</@layout.registrationLayout>
