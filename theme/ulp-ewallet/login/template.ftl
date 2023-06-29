<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>Sign in to ULP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

	<body>

        <#nested "header">
        <div class="logindiv">
            <div class="login-content-remove">
                <div class="box-remove">
                    <div>
                        <img class="leftarrow" src="${url.resourcesPath}/img/back_arrow.png" alt="ULP in UP" onclick="history.back()">
                        <center>
                            <img class="leftlogo" src="${url.resourcesPath}/img/logo.png" alt="ULP in UP">
                            <br>
                            <br>
                            <img class="textlogo" src="${url.resourcesPath}/img/wallet_logo.png" alt="ULP Text">
                        </center>
                        <br>
                    </div>
                    <#if displayMessage && message?has_content>
                    <div class="div_message alert alert-${message.type}">
                        <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                        <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                        <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                        <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                        <center><font class="message-text login_message">${message.summary}</font></center>
                    </div>
                    </#if>
                    <#nested "form">
                </div> 
            </div>
            <br>
            <br>
        </div>
	</body>
</html>
</#macro>
