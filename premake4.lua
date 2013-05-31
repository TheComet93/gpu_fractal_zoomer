----------------------------------------------------------------
-- Premake File - Builds project files
----------------------------------------------------------------

----------------------------------------------------------------
-- Global directories to include
----------------------------------------------------------------

local solutionIncludeDirs = {
	"include",
	"include/lib",
	"include/main",
	"$(SFML_HOME)/include"
}

----------------------------------------------------------------
-- 8-bit-challenge solution
----------------------------------------------------------------

-- Project name
solution "GPU-Fractal-Zoomer"

	-- Configurations
	configurations {
		"Debug",
		"Release"
	}

	-- Where to generate project files
	location "project"

	----------------------------------------------------------------
	-- Main application
	----------------------------------------------------------------

	project "GPU-Fractal-Zoomer"
		kind "ConsoleApp"
		language "C++"

		-- Files to include
		files {
			"src/main/**.cpp",
			"include/main/**.hpp"
		}

		-- header search directories
		includedirs (solutionIncludeDirs)

		-- global definitions
		defines {
			"SFML_DYNAMIC"
		}

		-- Debug configuration
		configuration "Debug"
			targetdir "bin/debug"
			defines {
				"DEBUG",
				"_DEBUG"
			}
			flags {
				"Symbols"
			}
			libdirs {
				"lib",
				"$(SFML_HOME)/lib"
			}
			links {
				"gpu-fractal-zoomer-lib_d",
				"sfml-main-d",
				"sfml-audio-d",
				"sfml-graphics-d",
				"sfml-system-d",
				"sfml-window-d"
			}

		-- Release configuration
		configuration "Release"
			targetdir "bin/release"
			defines {
				"NDEBUG"
			}
			flags {
				"Optimize"
			}
			libdirs {
				"lib"
			}
			links {
				"gpu-fractal-zoomer-lib"
			}

		----------------------------------------------------------------
		-- Main game library
		----------------------------------------------------------------

		project "gpu-fractal-zoomer-lib"
			kind "StaticLib"
			language "C++"
			files {
				"src/lib/**.cpp",
				"include/lib/**.hpp"
			}

			-- Header search directories
			includedirs (solutionIncludeDirs)

			-- Debug configuration
			configuration "Debug"
				targetdir "lib"
				targetsuffix "_d"
				defines {
					"DEBUG",
					"_DEBUG"
				}
				flags {
					"Symbols"
				}
				libdirs {
				--	"$(SFML_HOME)/lib"
				}
				links {
				}

			-- release configuration
			configuration "Release"
				targetdir "lib"
				defines {
					"NDEBUG"
				}
				flags {
					"Optimize"
				}
				libdirs {
				--	"$(SFML_HOME)/lib"
				}
				links {
				}
