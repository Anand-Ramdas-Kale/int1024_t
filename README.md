# int1024_t

## Quick Start
```sh
$ make
$ ./main
```

## Project Structure
- **`main.c`**: Demonstrates the usage of `int1024_t` functions.
- **`core.c`**: Contains function definitions and wrappers for assembly functions.
- **`.s files`**: Contains low-level assembly implementations for `int1024_t` operations.

## Usage
You can edit `main.c` to test or modify the `int1024_t` interface.

## Compilation
Ensure you have `make` installed, then compile the project using:
```sh
make
```

## Running the Program
After compilation, execute:
```sh
./main
```
This will run the example interface demonstrating `int1024_t` functionality.

## Dependencies
- GCC or Clang (for compiling C code and linking assembly files)
- Make (for building the project)

## Editing and Extending
Modify `core.c` to extend or optimize `int1024_t` operations. The `.s` files contain assembly-optimized functions.
