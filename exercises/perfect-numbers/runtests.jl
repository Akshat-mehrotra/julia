using Test
include("example.jl")

@testset "Smallest perfect number is classified correctly" begin
   @test classify(6) == "perfect"
end
@testset "Medium perfect number is classified correctly" begin
   @test classify(28) == "perfect"
end
@testset "Large perfect number is classified correctly" begin
   @test classify(33550336) == "perfect"
end
@testset "Smallest abundant number is classified correctly" begin
   @test classify(12) == "abundant"
end
@testset "Medium abundant number is classified correctly" begin
   @test classify(30) == "abundant"
end
@testset "Large abundant number is classified correctly" begin
   @test classify(33550335) == "abundant"
end
@testset "Smallest prime deficient number is classified correctly" begin
   @test classify(2) == "deficient"
end
@testset "Smallest non-prime deficient number is classified correctly" begin
   @test classify(4) == "deficient"
end
@testset "Medium deficient number is classified correctly" begin
   @test classify(32) == "deficient"
end
@testset "Large deficient number is classified correctly" begin
   @test classify(33550337) == "deficient"
end
@testset "Edge case (no factors other than itself) is classified correctly" begin
   @test classify(1) == "deficient"
end
@testset "Zero is rejected (not a natural number)" begin
   @test classify(0) == "Classification is only possible for natural numbers."
end
@testset "Negative integer is rejected (not a natural number)" begin
   @test classify(-1) == "Classification is only possible for natural numbers."
end
