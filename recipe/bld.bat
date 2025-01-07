mkdir build
cd build

cmake ^
      %CMAKE_ARGS% -GNinja ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_TESTING:BOOL=ON ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DBUILD_WITH_BLASFEO:BOOL=OFF ^
      -DMARCH_NATIVE:BOOL=OFF ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1

:: Test.
ctest --output-on-failure -C Release
if errorlevel 1 exit 1
