<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=(realm.password && realm.registrationAllowed && !registrationDisabled??); section>
    <#if section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
    <#elseif section = "form">
        <div id="box-container user_div">
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}"
                        method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <!--<label for="username"
                                class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>-->

                        <#if usernameEditDisabled??>
                            <div class="pt-1p flex-center">
                                <div class="flex-center w-100">
                                    <div class="w-100">
                                        <div class="label-float">
                                            <input tabindex="1" id="username"
                                                    aria-invalid="<#if message?has_content && message.type = 'error'>true</#if>"
                                                    class="${properties.kcInputClass!}" name="username"
                                                    value="${(login.username!'')}"
                                                    type="text" disabled
                                                    pattern="[6-9]{1}[0-9]{9}"
                                                    onkeypress="javascript:return isNum(event)"/>
                                            <label class="roboto">Enter Mobile Number</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <#else>
                            <div class="pt-1p flex-center">
                                <div class="flex-center w-100">
                                    <div class="w-100">
                                        <div class="label-float">
                                            <input tabindex="1" id="username"
                                                    aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                                    class="${properties.kcInputClass!}" name="username"
                                                    value="${(login.username!'')}"
                                                    type="text" autofocus autocomplete="off"
                                                    pattern="[6-9]{1}[0-9]{9}"
                                                    onkeypress="javascript:return isNum(event)"/>
                                            <label class="roboto">Enter Mobile Number</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#if>

                        <#if messagesPerField.existsError('username')>
                            <!--<span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>-->
                            <br />
                            <center><font class="pooppins" style="color:red;">Invalid Phone Number</font></center>
                        </#if>
                    </div>

                    <!--<div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options">
                            <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"
                                                    checked> ${msg("rememberMe")}
                                        <#else>
                                            <input tabindex="3" id="rememberMe" name="rememberMe"
                                                    type="checkbox"> ${msg("rememberMe")}
                                        </#if>
                                    </label>
                                </div>
                            </#if>
                        </div>
                    </div>-->

                    <div id="kc-form-buttons" class="flex-center pt-1p">
                        <input tabindex="4"
                                class="btn-blue Urbanist"
                                name="login" id="kc-login" type="submit" value="Get OTP"/>
                    </div>
                    <div id="kc-form-buttons" class="flex-center pt-1p">
                        <input class="btn-blue Urbanist" type="button" onclick="registerLink();" value="Register as New User"/>
                    </div>
                </form>
            </#if>
            <#if realm.password && social.providers??>
                <center><div class="form_div">
                    <br/>
                    <h2 class="pooppins"><span>OR</span></h2>
                    <#list social.providers as p>
                        <div id="kc-form-buttons" class="flex-center pt-1p">
                            <input class="btn-blue Urbanist" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                        </div>
                    </#list>
                </div></center>
            </#if>
        </div>
        <script>
            function registerLink() {
                const searchParams = new URLSearchParams(window.location.search);
                const redirectURL=searchParams.get('redirect_uri');
                const url = new URL(redirectURL);  
                const domain = url.hostname;  
                const protocol =url.protocol;
                location.href=protocol+'//'+domain+'/register';
            }
           function isNum(evt)
           {
                let textValue=evt.target.value;
                let textValueLength=textValue.length;
                if(textValueLength<10)
                {
                    var charCode=(evt.which)?evt.which:event.keyCode
                    if(charCode>31 && (charCode<48 || charCode>57)){
                        return false;
                    }
                    else{
                        return true;
                    }
                }
                else
                {
                    return false;
                }
            }
        </script>
    </#if>
</@layout.registrationLayout>
