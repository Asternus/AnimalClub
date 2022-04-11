<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Animal club</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#if !user??>
            <li class="nav-item">
                <a class="nav-link" href="/guest">About us</a>
            </li>
            </#if>
            <#if user?? && isUser>
                <li class="nav-item">
                    <a class="nav-link" href="/guild">Guild</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/main">Posts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user-messages/${currentUserId}">My posts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Settings</a>
                </li>
            </#if>
            <#if user?? && isVip>
                <li class="nav-item">
                    <a class="nav-link" href="/vipPanel">Vip panel</a>
                </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Admin panel</a>
                </li>
            </#if>
                <li class="nav-item">
                    <a class="nav-link" href="/contacts">Contacts</a>
                </li>
        </ul>

        <div class="navbar-text mr-3"><#if user?? && isUser>${name}<#else>Please, login</#if></div>
        <div>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit"><#if user?? && isUser>Sign Out<#else>Log in</#if></button>
            </form>
        </div>
    </div>
</nav>