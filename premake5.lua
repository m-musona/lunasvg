project "plutovg"
    kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "plutovg/include/plutovg.h",
        "plutovg/source/*.c",
        "plutovg/source/*.h"
    }

    includedirs
    {
        "plutovg/include",
        "plutovg/source"
    }

    defines
    {
        "PLUTOVG_STATIC",
        "_CRT_SECURE_NO_WARNINGS",
        "_USE_MATH_DEFINES"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

project "lunasvg"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/lunasvg.h",
        "source/*.cpp",
        "source/*.h"
    }

    includedirs
    {
        "include",
        "source",
        "plutovg/include"
    }

    defines
    {
        "LUNASVG_STATIC",
        "_CRT_SECURE_NO_WARNINGS"
    }

    links
    {
        "plutovg"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"