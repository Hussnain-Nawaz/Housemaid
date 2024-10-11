import 'package:house_maid_project/AModels/HMQuestionsModel.dart';
import 'package:house_maid_project/AModels/OtpModel.dart';
import 'package:house_maid_project/AModels/RegisterationModel.dart';
import 'package:house_maid_project/AModels/SIgnInGoogleModel.dart';
import 'package:house_maid_project/AModels/loginModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import your RegisterationModel class
// Adjust according to your project structure
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIs {
  final String baseUrl =
      "https://2914-182-184-252-97.ngrok-free.app/api"; // Base URL for your API

  Future<loginModel> login({
    required String email,
    required String password,
    required int roleid,
    required String deviceid,
  }) async {
    // Construct the URL with query parameters for role_id and device_id
    var url = Uri.parse(
        '$baseUrl/login?role_id=${Uri.encodeComponent(roleid.toString())}&device_id=${Uri.encodeComponent(deviceid)}');
    print("Fetching from URL: $url");

    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      // Create the body of the POST request
      var body = jsonEncode({
        'email': email,
        'password': password,
      });
      print(' body is : ${body}');

      // Make the POST request
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      // Print the response details for debugging
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      // Handle successful status codes (200, 201, 302)

      var jsonResponse = jsonDecode(response.body);

      // Parse the response into the loginModel
      return loginModel.fromJson(jsonResponse);
    } catch (e) {
      print("Error occurred: $e");
      // Handle any exceptions or network errors and return a model with an error message
      return loginModel(
        statusCode: 500,
        status: false,
        message: "An error occurred: $e",
      );
    }
  }

  //HousemaidCompleteData

  Future<HMQuestionsMOdel> submitHousemaidDetails({
    required int roleid,
    required String email,
    required String password,
    required List<String> questions,
    required List<String> answers,
    required List<Map<String, String>> schedule,
    required int hourlyRate,
    required String currency,
    required String country,
    required String identityType,
    required List<Map<String, String>>
        documents, // Each map contains a 'type' and a 'path'
  }) async {
    // Construct the URL
    var url = Uri.parse('$baseUrl/housemaid/register-with-questions');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add fields to the request (including the name, email, and password as form fields)

    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['role_id'] = roleid.toString();
    request.fields['questions'] = jsonEncode(questions);
    request.fields['answers'] = jsonEncode(answers);
    request.fields['schedule'] = jsonEncode(schedule);
    request.fields['hourly_rate'] = hourlyRate.toString();
    request.fields['currency'] = currency;
    request.fields['country'] = country;
    request.fields['identity_type'] = identityType;

    // Attach the documents to the request as files
    // Attach the documents to the request
    for (int i = 0; i < documents.length; i++) {
      String filePath = documents[i]['path']!;
      String fieldName = 'documents[$i]'; // Indexed name like "documents[0]"

      // Attach the file to the request
      request.files.add(
        await http.MultipartFile.fromPath(fieldName, filePath),
      );
    }

    // Print the fields and files to simulate the request body
    print("===== Request Data =====");
    print("URL: $url");
    print("Method: POST");

    // Print form fields
    print("Form Fields:");
    request.fields.forEach((key, value) {
      print("- $key: $value");
    });

    // Print file fields
    print("Files:");
    for (var file in request.files) {
      print("- Field: ${file.field}, Filename: ${file.filename},");
    }
    print("========================");

    // Set headers for the multipart request
    request.headers.addAll({
      'Accept': 'application/json',
      // Add more headers if required by your backend
    });

    // Send the request and await the response
    var response = await request.send();

    // Read the response
    var responseBody = await response.stream.bytesToString();
    print("Response status code: ${response.statusCode}");
    print("Response body: $responseBody");

    // If the response code is 200, decode the response body into HMQuestionsModel
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(responseBody);
      return HMQuestionsMOdel.fromJson(jsonResponse);
    } else {
      // Handle other status codes and return a model with an error message
      return HMQuestionsMOdel(
        statusCode: response.statusCode,
        status: false,
        message: "Failed to submit details. Please try again.",
        data: null,
      );
    }
  }

  //Google SignIn
  Future<SignInGoogleModel> googleSignInInit({
    required int roleId,
    required String deviceId,
  }) async {
    // Construct the URL with query parameters for device_id and role_id
    //role_id=$roleId&device_id=$deviceId
    var url = Uri.parse(
        '$baseUrl/signin/google?role_id=${Uri.encodeComponent(roleId.toString())}&device_id=${Uri.encodeComponent(deviceId)}');
    print("Fetching from URL: $url");

    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      // Make the GET request
      var response = await http.get(
        url,
        headers: headers,
      );

      // Print the response details for debugging
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      // Check for a successful redirection status code (302)
      if (response.statusCode == 302 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);

        // Parse the response into the SignInGoogleModel
        return SignInGoogleModel.fromJson(jsonResponse);
      } else {
        // Handle other status codes and return a model with an error message
        return SignInGoogleModel(
          statusCode: response.statusCode,
          status: false,
          message: "Failed to get redirection URL or log in.",
        );
      }
    } catch (e) {
      print("Error occurred: $e");
      // Handle any exceptions or network errors
      return SignInGoogleModel(
        statusCode: 500,
        status: false,
        message: "An error occurred while fetching the URL: $e",
      );
    }
  }

  // Registration API Function
  Future<RegisterationModel> registrationAPI({
    required int roleid,
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      var url = Uri.parse('$baseUrl/register?role_id=$roleid');
      print("My URL is $url");
      print("My roleid is $roleid");

      // Request body for registration
      var body = jsonEncode({
        'name': fullName,
        'email': email,
        'password': password,
      });
      print("My body is $body");

      // Make a POST request to the registration endpoint
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      print('API returned status: ${response.statusCode}');

      // Check for successful status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        return RegisterationModel.fromJson(jsonResponse);
      } else {
        // Handle error response codes
        var jsonResponse = jsonDecode(response.body);
        return RegisterationModel(
          status: false,
          message: jsonResponse['message'] ?? 'Unknown error occurred',
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      print('Error in API call: $error');
      // Return a failed registration model in case of exception
      return RegisterationModel(
        status: false,
        message: 'Failed to connect. Please try again.',
        statusCode: 500,
      );
    }
  }

  //ClintOTP
  Future<OtpModel> clientOtpAPI({
    required String email,
    required String otp,
  }) async {
    var url =
        Uri.parse('$baseUrl/verify-otp'); // Replace with your actual endpoint

    // Request body
    var body = jsonEncode({
      'otp': otp,
      'email': email,
    });
    print("My body is $body");
    print("My URL is $url");

    // Make a POST request to the OTP verification endpoint
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    print('API returned status: ${response.statusCode}');

    // Directly parse and return the response
    var jsonResponse = jsonDecode(response.body);
    return OtpModel.fromJson(jsonResponse);
  }
}
