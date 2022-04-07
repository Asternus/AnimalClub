package com.ac.repository;

import com.ac.Entity.Message;
import com.ac.Entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessageRepo extends JpaRepository<Message, Long> {

    Page<Message> findAll(Pageable pageable);

    Page<Message> findByTag(String tag, Pageable pageable);

    Page<Message> findMessagesByAuthor_Guild (String guild, Pageable pageable);

    @Query("from Message m where m.author =:author")
    Page<Message> findByUser(Pageable pageable, @Param("author") User author);

    List<Message> findMessagesByAuthorId(Long author_id);

}
