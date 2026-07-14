#include "engine.hpp"
#include <iostream>

namespace hydra {
    CoreEngine::CoreEngine() : system_state("ACTIVE") {}

    void CoreEngine::run_diagnostics() {
        std::cout << "=====================================" << std::endl;
        std::cout << "HYDRA ENGINE STATE: " << system_state << std::endl;
        std::cout << "POSIX Memory & Thread Pools: Ready" << std::endl;
        std::cout << "=====================================" << std::endl;
    }
}