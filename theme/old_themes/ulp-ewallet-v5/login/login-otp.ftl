<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('totp'); section>
    <#if section="header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
    <#elseif section="form">
        <div class="box-container user_div">
        <form id="kc-otp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
            method="post">
            <#if otpLogin.userOtpCredentials?size gt 1>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <#list otpLogin.userOtpCredentials as otpCredential>
                            <input id="kc-otp-credential-${otpCredential?index}" class="${properties.kcLoginOTPListInputClass!}" type="radio" name="selectedCredentialId" value="${otpCredential.id}" <#if otpCredential.id == otpLogin.selectedCredentialId>checked="checked"</#if>>
                            <label for="kc-otp-credential-${otpCredential?index}" class="${properties.kcLoginOTPListClass!}" tabindex="${otpCredential?index}">
                                <span class="${properties.kcLoginOTPListItemHeaderClass!}">
                                    <span class="${properties.kcLoginOTPListItemIconBodyClass!}">
                                      <i class="${properties.kcLoginOTPListItemIconClass!}" aria-hidden="true"></i>
                                    </span>
                                    <span class="${properties.kcLoginOTPListItemTitleClass!}">${otpCredential.userLabel}</span>
                                </span>
                            </label>
                        </#list>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <!--<div class="${properties.kcLabelWrapperClass!}">
                    <label for="otp" class="${properties.kcLabelClass!}">${msg("loginOtpOneTime")}</label>
                </div>-->

                <div class="${properties.kcInputWrapperClass!}">
                    <div class="pt-1p flex-center">
                        <div class="flex-center w-400">
                            <div class="w-90">
                                <div class="label-float">
                                    <input id="otp" name="otp" autocomplete="off" type="text" class="${properties.kcInputClass!}"
                                        autofocus aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>"/>
                                    <label class="roboto">OTP</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <#if messagesPerField.existsError('totp')>
                        <!--<span id="input-error-otp-code" class="${properties.kcInputErrorMessageClass!}"
                            aria-live="polite">
                            ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                        </span>-->
                        <br />
                        <center><font class="pooppins" style="color:red;">${message.summary}</font></center> 
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="flex-center pt-1p">
                    <input
                        class="btn-blue Urbanist"
                        name="login" id="kc-login" type="submit" value="Login" />
                </div>
            </div>
        </form>
        </div>
    </#if>
</@layout.registrationLayout>