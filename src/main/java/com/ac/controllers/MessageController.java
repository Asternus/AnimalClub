package com.ac.controllers;

import com.ac.Entity.Message;
import com.ac.Entity.User;
import com.ac.repository.MessageRepo;
import com.ac.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;

@Controller
public class MessageController {
    private final MessageRepo messageRepo;

    private final MessageService messageService;

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    public MessageController(MessageRepo messageRepo, MessageService messageService) {
        this.messageRepo = messageRepo;

        this.messageService = messageService;
    }

    @GetMapping("/")
    public String greeting(@AuthenticationPrincipal User user,
                           Model model) {

        if (user != null) {
            model.addAttribute("findUserMessages", messageService.findUserMessages(user.getId()));
            model.addAttribute("vipStatus", messageService.getVipStatus(user));
            model.addAttribute("aboutYou", messageService.getAboutYou(user));
        }

        model.addAttribute("user", user);
        model.addAttribute("isCurrentUser", user != null);
        return "greeting";
    }

    @GetMapping("/contacts")
    public String contacts() {
        return "contacts";
    }


    @GetMapping("/guest")
    public String guest() {
        return "guest";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            request.getSession().invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<Message> page = messageService.messageList(pageable, filter);

        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);

        return "main";
    }

    @GetMapping("/guild")
    public String guild(
            @AuthenticationPrincipal User user,
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<Message> page = messageService.messageListForGuild(pageable, user.getGuild());

        model.addAttribute("user", user);
        model.addAttribute("page", page);
        model.addAttribute("url", "/guild");

        return "guild";
    }

    @GetMapping("/vipPanel")
    public String vipPanel(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false) String guild,
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<Message> page = messageService.messageListForGuild(pageable, guild);

        model.addAttribute("page", page);
        model.addAttribute("guild", messageService.getGuilds(guild));
        model.addAttribute("user", user);
        model.addAttribute("isVip", user.isVipStatus());
        model.addAttribute("url", "/vipPanel");

        return "vipPanel";
    }


    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {

        Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

        if (message.getTag().isEmpty()) {
            Page<Message> page = messageService.messageList(pageable, "");
            model.addAttribute("tagError", "Tag should be not empty");
            model.addAttribute("url", "/main");
            model.addAttribute("page", page);
            model.addAttribute("userMessage", message);
            model.mergeAttributes(errors);
            return "main";
        }

        if (message.getText().isEmpty()) {
            Page<Message> page = messageService.messageList(pageable, "");
            model.addAttribute("textError", "Text should be not empty");
            model.addAttribute("url", "/main");
            model.addAttribute("page", page);
            model.addAttribute("userMessage", message);
            model.mergeAttributes(errors);
            return "main";
        }

        if (bindingResult.hasErrors()) {
            Page<Message> page = messageService.messageList(pageable, "");
            model.addAttribute("message", "Error");
            model.addAttribute("url", "/main");
            model.addAttribute("page", page);
            return "main";

        } else {
            message.setAuthor(user);
            messageRepo.save(message);
            Iterable<Message> messages = messageRepo.findAll();
            model.addAttribute("messages", messages);
            return "redirect:/main";
        }
    }

    @GetMapping("/user-messages/{author}")
    public String userMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<Message> page = messageService.messageListForUser(pageable, author);

        model.addAttribute("userChannel", author);
        model.addAttribute("subscriptionsCount", author.getSubscriptions().size());
        model.addAttribute("subscribersCount", author.getSubscribers().size());
        model.addAttribute("isSubscriber", author.getSubscribers().contains(currentUser));
        model.addAttribute("page", page);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("url", "/user-messages/" + author.getId());

        return "userMessages";
    }

    @PostMapping("/user-messages/{user}")
    public String updateMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam("id") Message message,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("link") String link
    ) {

        if (message.getAuthor().equals(currentUser)) {
            if (!text.isEmpty()) {
                message.setText(text);
            }

            if (!tag.isEmpty()) {
                message.setTag(tag);
            }

            if (!link.isEmpty()) {
                message.setLink(link);
            }

            messageRepo.save(message);
        }

        return "redirect:/user-messages/" + user;
    }

    @GetMapping("/del-user-messages/{user}")
    public String deleteMessage(
            @PathVariable Long user,
            @RequestParam("message") Long messageId
    ) {

        messageRepo.deleteById(messageId);

        return "redirect:/user-messages/" + user;
    }

}
