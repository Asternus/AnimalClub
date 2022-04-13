package com.ac.controllers;


import com.ac.Entity.Role;
import com.ac.Entity.User;
import com.ac.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/user")
public class AdminController {

    private final UserService userService;

    @Autowired
    public AdminController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam Map<String, String> form,
                          Model model,
                          @Valid User user,
                          BindingResult bindingResult
    ) {

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("errors", "errors");

            return "admReg";
        }

        if (!userService.addUserByAdmin(user, form)) {
            model.addAttribute("usernameError", "User exists!");
            model.addAttribute("roleError", "Role error!");
            return "admReg";
        }

        return "redirect:/user";
    }

    @GetMapping("/registration")
    public String adminAddUser(Model model) {
        model.addAttribute("roles", Role.values());
        return "admReg";
    }

    @GetMapping
    public String userList(@RequestParam(required = false, defaultValue = "") String filter,
                           Model model) {

        Iterable<User> users = userService.findAll();

        if (filter != null && !filter.isEmpty()) {
            users = userService.findByUserName(filter);
        } else {
            users = userService.findAll();
        }

        model.addAttribute("users", users);
        model.addAttribute("filter", filter);

        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user,
            @RequestParam("guild") String guild,
            @RequestParam("vipStatus") boolean vipStatus,
            Model model){

        model.addAttribute("user", user);
        model.addAttribute("status", user.isVipStatus());


        userService.saveUser(user, username, form, guild, vipStatus);

        return "redirect:/user";
    }

    @GetMapping("/del/{user}")
    public String deleteMessage(
            @PathVariable Long user
    ) {

        userService.deleteUserByID(user);

        return "redirect:/user/";
    }

    @GetMapping ("/ban/{user}")
    public String userBan(
            @PathVariable Long user,
            Model model){

        userService.banUser(user);

        return "redirect:/user";
    }

}