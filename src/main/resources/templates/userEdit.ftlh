<#import "parts/common.ftlh" as c>

<@c.page>

    <form action="/user" method="post">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Username</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username"
                   value="${user.username}">
            <div id="emailHelp" class="form-text">Change user name</div>
        </div>

        <#list roles as role>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1"
                       name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                <label class="form-check-label" for="exampleCheck1">${role}</label>
            </div>
        </#list>

        <br>
        <div>
            <b> Statistics:</b>
            <p> <b>User ID:</b> ${user.getId()}</p>
            <p> <b>Username:</b> ${user.getUsername()}</p>
            <p> <b>User guild:</b> ${user.getGuild()}</p>
            <p> <b>User VIP:</b> ${user.isVipStatus()?string('VIP', 'DISABLED')}</p>
        </div>

        <br>
        <div>
            <b>Guild:</b> <input type="radio" class="btn-check" name="guild" id="option1" autocomplete="off" checked value="WILD">
            <label class="btn btn-secondary" for="option1">WILD</label>

            <input type="radio" class="btn-check" name="guild" id="option2" autocomplete="off" value="PETS">
            <label class="btn btn-secondary" for="option2">PETS</label>

            <input type="radio" class="btn-check" name="guild" id="option3" autocomplete="off" value="RACCOONS">
            <label class="btn btn-secondary" for="option3">RACCOONS</label> <br>
        </div>

        <br> <b>VIP Status:</b>

        <#if user.isVipStatus()>
            <input type="radio" class="btn-check" name="vipStatus" id="option4" autocomplete="off" checked value="true">
            <label class="btn btn-secondary" for="option4">VIP</label>
            <input type="radio" class="btn-check" name="vipStatus" id="option5" autocomplete="off" value="false">
            <label class="btn btn-secondary" for="option5">DISABLE</label> <br>
        <#else>
            <input type="radio" class="btn-check" name="vipStatus" id="option4" autocomplete="off" value="true">
            <label class="btn btn-secondary" for="option4">VIP</label>
            <input type="radio" class="btn-check" name="vipStatus" id="option5" autocomplete="off" checked
                   value="false">
            <label class="btn btn-secondary" for="option5">DISABLE</label> <br>
        </#if>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-primary">Save</button>
    </form> <br>

</@c.page> <br>