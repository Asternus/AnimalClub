<#macro login path isRegisterForm>
    <form action="${path}" method="post">
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
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password:</label>
                <div class="col-sm-6">
                    <input type="password" name="password2"
                           class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           placeholder="Retype password" />
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
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
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="form-floating">
                <textarea name="aboutUser" class="form-control" placeholder="About you" id="floatingTextarea2" style="height: 60px"></textarea>
            </div>


            <br> <b><p class="fw-bold">Please, choose you guild</p></b>
            <p class="fw-light">If you like wild animal you could choose "wild guild"</p>
            <p class="fw-light">If you like pets you could choose "pets guild"</p>
            <p class="fw-light">But if you like raccoons, you are the best</p>


            <input type="radio" class="btn-check" name="Guild" id="option1" autocomplete="off" checked value="WILD">
                <label class="btn btn-secondary" for="option1">WILD</label>

                <input type="radio" class="btn-check" name="Guild" id="option2" autocomplete="off" value="PETS">
                <label class="btn btn-secondary" for="option2">PETS</label>


            <input type="radio" class="btn-check" name="Guild" id="option3" autocomplete="off" value="RACCOONS">
            <label class="btn btn-secondary" for="option3">RACCOONS</label> <br>

            <br> <div class="col-sm-6">
                <div class="g-recaptcha" data-sitekey="6LdFYisfAAAAAEpTDnf6zSk5vYj8O72gfdVcPQXN"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>

        <#if !isRegisterForm>
       <div class="btn-group">
            <a href="/registration" class="btn btn-primary active" aria-current="page">Add new user</a>
        </div> <br>
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <br> <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
    </form> <br>
</#macro>