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
        <div class="box-container user_div">
        <#if realm.password>
            <div class="form_div_remove">
                <div class="bg-white1">
                    <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                        <div class="pt-1p flex-center">
                            <div class="flex-center w-400">
                                <div class="w-90">
                                    <div class="label-float">
                                        <input id="username" type="text" placeholder=" " name="username" tabindex="1" />
                                        <label class="roboto">Enter Username</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pt-1p flex-center">
                            <div class="flex-center w-400">
                                <div class="w-90">
                                    <div class="position-relative max-400">
                                        <div class="label-float">
                                            <input id="password" type="password" placeholder=" " name="password" tabindex="2" />
                                            <label class="roboto">Enter Password</label>
                                        </div>
                                        <div class="eye" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png" class="pass_icon"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <#if message?has_content>
                            <br />
                            <center><font class="pooppins" style="color:red;">${message.summary}</font></center>
                         </#if>
                        <div class="flex-center pt-1p">
                            <input class="btn-blue Urbanist" type="submit" value="Login" tabindex="3">
                        </div>
                        <div class="fs-13 fw-400 pt-1p pooppins text-center">Not registered Yet? <a class="anker-r" href="https://prod-avsar.uniteframework.io/register">Register Here</a></div>
                    </form>
                </div>
            </div>
        </#if>
        <#if social.providers??>
            <center><div class="form_div">
                <font class="pooppins text-center">or</font>
                <br/>
                <#list social.providers as p>
                <input class="btn-blue Urbanist" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div></center>
        </#if>
        </div>
    </#if>
</@layout.registrationLayout>
