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
                                <div class="flex-center w-400">
                                    <div class="w-90">
                                        <div class="label-float">
                                            <input tabindex="1" id="username"
                                                    aria-invalid="<#if message?has_content && message.type = 'error'>true</#if>"
                                                    class="${properties.kcInputClass!}" name="username"
                                                    value="${(login.username!'')}"
                                                    type="text" disabled/>
                                            <label class="roboto">Enter Phone Number</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <#else>
                            <div class="pt-1p flex-center">
                                <div class="flex-center w-400">
                                    <div class="w-90">
                                        <div class="label-float">
                                            <input tabindex="1" id="username"
                                                    aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                                    class="${properties.kcInputClass!}" name="username"
                                                    value="${(login.username!'')}"
                                                    type="text" autofocus autocomplete="off"/>
                                            <label class="roboto">Enter Phone Number</label>
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
                    <div class="fs-13 fw-400 pt-1p pooppins text-center">Not registered Yet? <a class="anker-r" href="https://prod-avsar.uniteframework.io/register">Register Here</a></div>
                </form>
            </#if>
            <#if realm.password && social.providers??>
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
