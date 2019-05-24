class PredictionData {
  String _fullName;
  String _dob;
  String _phone;
  String _email;
  String _duration;

  PredictionData(fullName, dob, phone, email, duration) {
    this._fullName = fullName;
    this._dob = dob;
    this._phone = phone;
    this._email = email;
    this._duration = duration;
  }

  void setFullName(fullName) {
    this._fullName = fullName;
  }
  String getFullName() {
    return this._fullName;
  }

  void setDob(dob) {
    this._dob = dob;
  }
  String getDob() {
    return this._dob;
  }

  void setPhone(phone) {
    this._phone = phone;
  }
  String getPhone() {
    return this._phone;
  }

  void setEmail(email) {
    this._email = email;
  }
  String getEmail() {
    return this._email;
  }

  void setDuration(duration) {
    this._duration = duration;
  }
  String getDuration() {
    return this._duration;
  }
}