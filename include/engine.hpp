#ifndef ENGINE_HPP
#define ENGINE_HPP

#include <string>

namespace hydra {
    class CoreEngine {
    public:
        CoreEngine();
        void run_diagnostics();
    private:
        std::string system_state;
    };
}

#endif // ENGINE_HPP