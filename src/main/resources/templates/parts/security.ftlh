<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    currentUserId = user.getId()
    isVip = user.isVipStatus()
    isUser = true
    >
<#else>
    <#assign
    name = "unknown"
    isAdmin = false
    currentUserId = -1
    isVip = false
    isUser = false
    >
</#if>