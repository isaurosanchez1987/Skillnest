package com.mired.mired_app.service;

import com.mired.mired_app.model.Friendship;
import com.mired.mired_app.model.FriendshipStatus;
import com.mired.mired_app.model.User;
import com.mired.mired_app.repository.FriendshipRepository;
import com.mired.mired_app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendshipService {
    @Autowired
    private FriendshipRepository friendshipRepository;

    @Autowired
    private UserRepository userRepository;

    public void sendRequest(Long fromId, Long toId) {
        User from = userRepository.findById(fromId).orElse(null);
        User to = userRepository.findById(toId).orElse(null);
        if (from != null && to != null && !friendshipRepository.existsByRequesterAndReceiver(from, to)) {
            Friendship friendship = new Friendship();
            friendship.setRequester(from);
            friendship.setReceiver(to);
            friendship.setStatus(FriendshipStatus.PENDING);
            friendshipRepository.save(friendship);
        }
    }

    public void acceptRequest(Long id) {
        friendshipRepository.findById(id).ifPresent(f -> {
            f.setStatus(FriendshipStatus.ACCEPTED);
            friendshipRepository.save(f);
        });
    }

    public void rejectRequest(Long id) {
        friendshipRepository.deleteById(id);
    }

    public void deleteFriendship(Long id) {
        friendshipRepository.deleteById(id);
    }

    public List<User> searchUsers(String name, Long currentUserId) {
        return userRepository.findAll().stream()
                .filter(u -> u.getName().toLowerCase().contains(name.toLowerCase()) && !u.getId().equals(currentUserId))
                .toList();
    }

    public List<Friendship> getPendingRequests(User user) {
        return friendshipRepository.findByReceiverAndStatus(user, FriendshipStatus.PENDING);
    }

    public List<Friendship> getFriends(User user) {
        return friendshipRepository.findByRequesterOrReceiverAndStatus(user, user, FriendshipStatus.ACCEPTED);
    }
}
