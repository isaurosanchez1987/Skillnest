package com.mired.mired_app.repository;

import com.mired.mired_app.model.Friendship;
import com.mired.mired_app.model.FriendshipStatus;
import com.mired.mired_app.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FriendshipRepository extends JpaRepository<Friendship, Long> {
    List<Friendship> findByReceiverAndStatus(User receiver, FriendshipStatus status);
    List<Friendship> findByRequesterOrReceiverAndStatus(User user1, User user2, FriendshipStatus status);
    boolean existsByRequesterAndReceiver(User requester, User receiver);
}
