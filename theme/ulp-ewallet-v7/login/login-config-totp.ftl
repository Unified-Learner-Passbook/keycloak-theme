<#import "template.ftl" as layout>
<@layout.registrationLayout displayRequiredFields=false displayMessage=!messagesPerField.existsError('totp','userLabel'); section>

    <#if section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
    <#elseif section = "form">
        <div class="box-container user_div">
            <center>
                <ol id="kc-totp-settings">
                    <li>
                        <p class="pooppins">${msg("loginTotpStep1")}</p>

                        <ul id="kc-totp-supported-apps">
                            <#list totp.policy.supportedApplications as app>
                                <li class="pooppins"><b>${app}</b></li>
                            </#list>
                        </ul>
                    </li>

                    <#if mode?? && mode = "manual">
                        <li>
                            <p class="pooppins">${msg("loginTotpManualStep2")}</p>
                            <p class="pooppins"><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                            <p class="pooppins"><a href="${totp.qrUrl}" id="mode-barcode">${msg("loginTotpScanBarcode")}</a></p>
                        </li>
                        <li>
                            <p class="pooppins">${msg("loginTotpManualStep3")}</p>
                            <p class="pooppins">
                            <ul>
                                <li class="pooppins" id="kc-totp-type">${msg("loginTotpType")}: ${msg("loginTotp." + totp.policy.type)}</li>
                                <li class="pooppins" id="kc-totp-algorithm">${msg("loginTotpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                                <li class="pooppins" id="kc-totp-digits">${msg("loginTotpDigits")}: ${totp.policy.digits}</li>
                                <#if totp.policy.type = "totp">
                                    <li class="pooppins" id="kc-totp-period">${msg("loginTotpInterval")}: ${totp.policy.period}</li>
                                <#elseif totp.policy.type = "hotp">
                                    <li class="pooppins" id="kc-totp-counter">${msg("loginTotpCounter")}: ${totp.policy.initialCounter}</li>
                                </#if>
                            </ul>
                            </p>
                        </li>
                    <#else>
                        <li>
                            <p class="pooppins">${msg("loginTotpStep2")}</p>
                            <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
                            <p class="pooppins"><a href="${totp.manualUrl}" id="mode-manual">${msg("loginTotpUnableToScan")}</a></p>
                        </li>
                    </#if>
                    <li>
                        <p class="pooppins">${msg("loginTotpStep3")}</p>
                        <p class="pooppins">${msg("loginTotpStep3DeviceName")}</p>
                    </li>
                </ol>
            </center>

        <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-totp-settings-form" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <!--<div class="${properties.kcInputWrapperClass!}">
                    <label for="totp" class="control-label">${msg("authenticatorCode")}</label> <span class="required">*</span>
                </div>-->
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="pt-1p flex-center">
                        <div class="flex-center w-100">
                            <div class="w-100">
                                <div class="label-float">
                                    <input type="text" id="totp" name="totp" autocomplete="off" class="${properties.kcInputClass!}"
                                        aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>"
                                        pattern="[0-9]{6}"
                                        onkeypress="javascript:return isNum(event)"/>
                                    <label class="roboto">Enter OTP</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <#if messagesPerField.existsError('totp')>
                        <!--<span id="input-error-otp-code" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                        </span>-->
                        <br />
                        <center><font class="pooppins" style="color:red;">${message.summary}</font></center>
                    </#if>

                </div>
                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                <#if mode??><input type="hidden" id="mode" name="mode" value="${mode}"/></#if>
            </div>

            <div class="${properties.kcFormGroupClass!}" style="display:none;">
                <div class="${properties.kcInputWrapperClass!}">
                    <label for="userLabel" class="control-label">${msg("loginTotpDeviceName")}</label> <#if totp.otpCredentials?size gte 1><span class="required">*</span></#if>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="${properties.kcInputClass!}" id="userLabel" name="userLabel" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('userLabel')>true</#if>"
                    />

                    <#if messagesPerField.existsError('userLabel')>
                        <span id="input-error-otp-label" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('userLabel'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="flex-center pt-1p">
                <#if isAppInitiatedAction??>
                    <input type="submit"
                        class="btn-blue Urbanist"
                        id="saveTOTPBtn" value="Submit"
                    />
                    <button type="submit"
                            class="btn-blue Urbanist"
                            id="cancelTOTPBtn" name="cancel-aia" value="true" />${msg("doCancel")}
                    </button>
                <#else>
                    <input type="submit"
                        class="btn-blue Urbanist"
                        id="saveTOTPBtn" value="Submit"
                    />
                </#if>
            </div>
        </form>
        </div>
        <script>
           function isNum(evt)
           {
                let textValue=evt.target.value;
                let textValueLength=textValue.length;
                if(textValueLength<6)
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