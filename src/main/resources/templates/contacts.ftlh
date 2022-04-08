<#import "parts/common.ftlh" as c>

<@c.page>

    <div><h5>Briefly about the technologies used in the project:</h5></div> <br>

    <div>
        <p>This project was created with Spring MVC and Bootstrap technology.</p>
        <p>Registration and security implemented with “spring security”. Some part of site is hiding.
            If user want open all site he's going to registration. Each email must be verified with “JavaMailSender”.
            SMTP configuration is used for sending. Captcha is used to protect against bot registration.</p>
        <p>The project does not store any external files, only links to them.
            Which facilitates the situation with the size of the repository where the project is located.</p>
        <p>A full-fledged admin panel has been set up for managing users and implemented a system of VIP users using java core.
            Privileged users have access to parts of the site where ordinary users cannot.</p>
        <p>For the validation I use “spring validation”. Some parameters as “password” or email should be not empty. </p>
        <p>PostgreSQL was used as the database for the project.</p>
        <p>To reduce the amount when "lombok" was used.</p>
        <p>Maven was used as the project builder.</p>
        <p>The “jasypt” technology was used to encrypt personal data.</p>
        <p>You can see more details on the project github: <a target="_blank" href="https://github.com/Asternus/AnimalClub">Project</a> </p> <br>

    </div>

    <div><h5>About me:</h5></div> <br>

    <div>
        Hi everyone. My name is <b>Yurii</b>. I`m Java developer. I am looking for a new career opportunity as a Java Software Engineer.
    </div> <br>

    <table class="table table-bordered border-primary">
        <tbody>
        <tr>
            <td>Core Java</td>
            <td>Spring Framework</td>
            <td>Generics</td>
            <td>Git</td>
        </tr>
        <tr>
            <td>Maven</td>
            <td>JDBC</td>
            <td>IO/NIO</td>
            <td>SQL</td>
        </tr>
        <tr>
            <td>Collections</td>
            <td>Exceptions</td>
            <td>REST API</td>
            <td>hibernate</td>
        </tr>
        <tr>
            <td>SOLID</td>
            <td>JavaScript</td>
            <td>HTML + CSS</td>
            <td>JUnit</td>
        </tr>
        </tbody>
    </table> <br>

    <div><h5>My contacts:</h5></div> <br>

    <table class="table table-bordered border-primary">
        <tbody>
        <tr>
            <td>github:</td>
            <td><div class="btn-group">
                    <a target="_blank" href="https://github.com/Asternus" class="btn btn-primary active"
                       aria-current="page">github</a>
                </div> </td>
        </tr>
        <tr>
            <td>linkedin</td>
            <td><div class="btn-group">
                    <a target="_blank" href="https://www.linkedin.com/in/asternus" class="btn btn-primary active"
                       aria-current="page">linkedin</a>
                </div></td>
        </tr>
        <tr>
            <td>CV</td>
            <td><div class="btn-group">
                    <a target="_blank" href="https://cv2you.com/resume/KNRi/" class="btn btn-primary active"
                       aria-current="page">CV</a>
                </div></td>
        </tr>
        <tr>
            <td>email:</td>
            <td><a href="mailto:asternyus@gmail.com">asternyus@gmail.com</a></td>
        </tr>
        </tbody>
    </table> <br>

</@c.page> <br> <br>