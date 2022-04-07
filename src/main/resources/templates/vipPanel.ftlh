<#import "parts/common.ftlh" as c>

<@c.page>

    <#if user?? && isVip>
        <h3><p>Its ${guild}</p></h3> <br>

        <form method="get" action="/vipPanel">

        <input type="radio" class="btn-check" name="guild" id="option1" autocomplete="off" checked value="WILD">
        <label class="btn btn-secondary" for="option1">WILD</label>

        <input type="radio" class="btn-check" name="guild" id="option2" autocomplete="off" value="PETS">
        <label class="btn btn-secondary" for="option2">PETS</label>

        <input type="radio" class="btn-check" name="guild" id="option3" autocomplete="off" value="RACCOONS">
        <label class="btn btn-secondary" for="option3">RACCOONS</label> <br>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <br> <button class="btn btn-primary" type="submit">Search</button>
        </form> <br>

        <#include "parts/messageList.ftlh" />
    <#else>
        <h5>Please active you VIP status</h5>
    </#if>

</@c.page>