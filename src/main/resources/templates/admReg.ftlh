<#import "parts/common.ftlh" as c>

<@c.page>
    <form action="/user/registration" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User Name :</label>
            <div class="col-sm-6">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="User name" />
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Password" />
                <#if errors??>
                    <div class="invalid-feedback">
                        ${errors}
                    </div>
                </#if>
            </div>
        </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Email:</label>
                <div class="col-sm-6">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                           placeholder="some@some.com" />
                    <#if errors??>
                        <div class="invalid-feedback">
                            ${errors}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="ADMIN">
                <label class="form-check-label" for="exampleCheck1" >ADMIN</label> <br>
                <input type="checkbox" class="form-check-input" id="exampleCheck2" name="USER">
                <label class="form-check-label" for="exampleCheck2" >USER</label>
                <#if errors??>
                    <div class="invalid-feedback">
                        ${errors}
                    </div>
                </#if>
            </div>

        <input type="radio" class="btn-check" name="Guild" id="option1" autocomplete="off" checked value="WILD">
        <label class="btn btn-secondary" for="option1">WILD</label>

        <input type="radio" class="btn-check" name="Guild" id="option2" autocomplete="off" value="PETS">
        <label class="btn btn-secondary" for="option2">PETS</label>

        <input type="radio" class="btn-check" name="Guild" id="option3" autocomplete="off" value="RACCOONS">
        <label class="btn btn-secondary" for="option3">RACCOONS</label> <br>

        <b>VIP Status:</b>

        <input type="radio" class="btn-check" name="vipStatus" id="option4" autocomplete="off" value="true">
        <label class="btn btn-secondary" for="option4">VIP</label>

        <input type="radio" class="btn-check" name="vipStatus" id="option5" autocomplete="off" value="false">
        <label class="btn btn-secondary" for="option5">disable</label> <br>

        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Create</button>
    </form>
</@c.page>