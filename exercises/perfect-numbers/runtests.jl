# canonical version = 1.3.0
using Test

using LazyJSON
include("example.jl")

jsonfileinstringbecausecannotreadfromanotherfile=
"""{
    "exercise": "perfect-numbers",
    "version": "1.1.0",
    "cases": [
        {
            "description": "Perfect numbers",
            "cases": [
                {
                    "description": "Smallest perfect number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 6
                    },
                    "expected": "perfect"
                },
                {
                    "description": "Medium perfect number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 28
                    },
                    "expected": "perfect"
                },
                {
                    "description": "Large perfect number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 33550336
                    },
                    "expected": "perfect"
                }
            ]
        },
        {
            "description": "Abundant numbers",
            "cases": [
                {
                    "description": "Smallest abundant number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 12
                    },
                    "expected": "abundant"
                },
                {
                    "description": "Medium abundant number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 30
                    },
                    "expected": "abundant"
                },
                {
                    "description": "Large abundant number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 33550335
                    },
                    "expected": "abundant"
                }
            ]
        },
        {
            "description": "Deficient numbers",
            "cases": [
                {
                    "description": "Smallest prime deficient number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 2
                    },
                    "expected": "deficient"
                },
                {
                    "description": "Smallest non-prime deficient number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 4
                    },
                    "expected": "deficient"
                },
                {
                    "description": "Medium deficient number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 32
                    },
                    "expected": "deficient"
                },
                {
                    "description": "Large deficient number is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 33550337
                    },
                    "expected": "deficient"
                },

                {
                    "description": "Edge case (no factors other than itself) is classified correctly",
                    "property": "classify",
                    "input": {
                        "number": 1
                    },
                    "expected": "deficient"
                }
            ]
        },
        {
            "description": "Invalid inputs",
            "cases": [
                {
                    "description": "Zero is rejected (not a natural number)",
                    "property": "classify",
                    "input": {
                        "number": 0
                    },
                    "expected": {
                        "error": "Classification is only possible for natural numbers."
                    }
                },
                {
                    "description": "Negative integer is rejected (not a natural number)",
                    "property": "classify",
                    "input": {
                        "number": -1
                    },
                    "expected": {
                        "error": "Classification is only possible for natural numbers."
                    }
                }
            ]
        }
    ]
}
"""

j = LazyJSON.value(jsonfileinstringbecausecannotreadfromanotherfile)

for i in j["cases"]
    for j in i["cases"]
        des = String(j["description"])
        inp = j["input"]["number"]

        i["description"] == "Invalid inputs" ? exped = j["expected"]["error"] : exped = j["expected"]
        @testset "$des" begin
           @test classify(inp) == exped
        end
    end
end
