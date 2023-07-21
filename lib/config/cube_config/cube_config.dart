final String SORT_ASC = "asc";
final String SORT_DESC = "desc";

final String USER_ARG_NAME = "user";
final String DIALOG_ARG_NAME = "dialog";
final String SELECTED_USERS_ARG_NAME = "selected_users";

enum LoginType { login, email, phone, facebook }

class ListItem<T> {
  bool isSelected = false;
  T data;
  ListItem(this.data);
}