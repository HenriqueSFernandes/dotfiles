#include <array>
#include <cstdio>
#include <iostream>
#include <memory>
#include <regex>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

std::string exec(const char* cmd) {
    std::array<char, 128> buffer;
    std::string result;
    std::shared_ptr<FILE> pipe(popen(cmd, "r"), pclose);
    if (!pipe) throw std::runtime_error("popen() failed!");
    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
        result += buffer.data();
    }
    return result;
}

std::vector<std::string> split(const std::string& str, char delimiter) {
    std::vector<std::string> tokens;
    std::string token;
    std::istringstream tokenStream(str);
    while (std::getline(tokenStream, token, delimiter)) {
        tokens.push_back(token);
    }
    return tokens;
}

int main() {
    const char* command = "hyprctl monitors";

    // Execute the command and get the output
    std::string output = exec(command);

    // Split the output by new lines
    std::vector<std::string> lines = split(output, '\n');

    // Regex to match lines containing "ID <id here>:"
    std::regex id_regex("ID\\s+(\\S+):");

    bool inBlock = false;
    int id = -1;

    for (const auto& line : lines) {
        std::smatch match;
        if (std::regex_search(line, match, id_regex)) {
            if (match.size() > 1) {
                std::string monitorID = match.str(1);
                monitorID.pop_back();
                id = stoi(monitorID);

                inBlock = true;
            }
        }
        if (inBlock && std::regex_search(line, std::regex("focused: yes"))) {
            std::cout << id << std::endl;
            break;
        }
    }

    if (id == -1) {
        return 1;
    }
    std::string eww_command =
        "eww open example --arg monitor=" + std::to_string(id);

    // Execute the eww command
    std::string eww_output = exec(eww_command.c_str());

    // Print the output of the eww command if needed
    std::cout << "Eww command output:\n" << eww_output << std::endl;
    return 0;
}
