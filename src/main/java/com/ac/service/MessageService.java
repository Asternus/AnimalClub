package com.ac.service;

import com.ac.Entity.Message;
import com.ac.Entity.User;
import com.ac.repository.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
    @Autowired
    private MessageRepo messageRepo;

    public Page<Message> messageList(Pageable pageable, String filter) {

        if (filter != null && !filter.isEmpty()) {
            return messageRepo.findByTag(filter, pageable);
        } else {
            return messageRepo.findAll(pageable);
        }
    }

    public Page<Message> messageListForUser(Pageable pageable, User author) {
        return messageRepo.findByUser(pageable, author);
    }


    public Page<Message> messageListForGuild(Pageable pageable, String guild) {
        return messageRepo.findMessagesByAuthor_Guild(guild, pageable);
    }

    public Long findUserMessages(Long userID) {

        if (messageRepo.findMessagesByAuthorId(userID) == null) {
            return 0L;
        }
        return (long) messageRepo.findMessagesByAuthorId(userID).size();
    }

    public String getVipStatus (User user) {
        if (user.isVipStatus()) {
            return "You are VIP";
        }
        return "disabled";
    }

    public String getAboutYou (User user) {
        if (user.getAboutUser() == null || user.getAboutUser().isEmpty()) {
            return "It's empty here";
        }
        return user.getAboutUser();
    }

    public String getGuilds (String string) {
        if (string == null || string.isBlank()) {
            return "It's empty here";
        }
        return string;
    }

}