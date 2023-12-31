//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef TEST_SUPPORT_CONCAT_MACROS_H
#define TEST_SUPPORT_CONCAT_MACROS_H

#include <cstdio>
#include <string>

#include "assert_macros.h"
#include "test_macros.h"

#ifndef TEST_HAS_NO_LOCALIZATION
#  include <sstream>
#endif

#if TEST_STD_VER > 17

#  ifndef TEST_HAS_NO_LOCALIZATION
template <class T>
concept test_char_streamable = requires(T&& value) { std::stringstream{} << std::forward<T>(value); };
#  endif

// If possible concatenates message for the assertion function, else returns a
// default message. Not being able to stream is not considered an error. For
// example, streaming to std::wcerr doesn't work properly in the CI. Therefore
// the formatting tests should only stream to std::string.
//
// The macro TEST_WRITE_CONCATENATED can be used to evaluate the arguments
// lazily. This useful when using this function in combination with
// assert_macros.h.
template <class... Args>
std::string test_concat_message([[maybe_unused]] Args&&... args) {
#  ifndef TEST_HAS_NO_LOCALIZATION
  if constexpr ((test_char_streamable<Args> && ...)) {
    std::stringstream sstr;
    ((sstr << std::forward<Args>(args)), ...);
    return sstr.str();
  } else
#  endif
    return "Message discarded since it can't be streamed to std::cerr.\n";
}

// Writes its arguments to stderr, using the test_concat_message helper.
#  define TEST_WRITE_CONCATENATED(...) [&] { ::test_eprintf("%s", ::test_concat_message(__VA_ARGS__).c_str()); }

#else

// Fallback definition before C++20 that allows using the macro but doesn't provide a very good message.
#  define TEST_WRITE_CONCATENATED(...) [&] { ::test_eprintf("%s", TEST_STRINGIZE(__VA_ARGS__)); }

#endif // TEST_STD_VER > 17

#endif //  TEST_SUPPORT_CONCAT_MACROS_H
