class SignupModel {
    List<Message> message;
    int count;
    bool value;

    SignupModel({
        required this.message,
        required this.count,
        required this.value,
    });

}

class Message {
    int userId;
    String vacationRequests;
    String sickLeaveRequests;
    String wfhRequests;
    List<Requestedby> requestedby;

    Message({
        required this.userId,
        required this.vacationRequests,
        required this.sickLeaveRequests,
        required this.wfhRequests,
        required this.requestedby,
    });

}

class Requestedby {
    int id;
    String email;
    String name;
    String phone;
    int userType;
    String tagLine;
    String userImage;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    Requestedby({
        required this.id,
        required this.email,
        required this.name,
        required this.phone,
        required this.userType,
        required this.tagLine,
        required this.userImage,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

}
