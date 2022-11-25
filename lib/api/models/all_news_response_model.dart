import './signup_response_model.dart';

class AllNewsModel {
  int? id;
  String? title;
  String? description;
  int? userId;
  int? leagueId;
  String? createdAt;
  String? updatedAt;
  int? matchId;
  AuthResponse? user;

  AllNewsModel(
      {this.id,
      this.title,
      this.description,
      this.userId,
      this.leagueId,
      this.createdAt,
      this.updatedAt,
      this.matchId,
      this.user});

  AllNewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    leagueId = json['league_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    matchId = json['match_id'];
    user = json['user'] != null ? AuthResponse.fromJson(json['user']) : null;
  }
}
