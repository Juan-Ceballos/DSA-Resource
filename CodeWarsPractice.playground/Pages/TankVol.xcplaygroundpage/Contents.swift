//: [Previous](@previous)

import Foundation

func tankVol(_ h: Int, _ d: Int, _ vt: Int) -> Int {
    let H = Float(h)
    let D = Float(d)
    let VT = Float(vt)

    let R = D / 2.0
    let l = VT / (pow(R, 2) * .pi)

    let A = pow(R, 2) * acos((R - H) / R) - (R - H) * sqrt(2.0 * R * H - pow(H, 2))
    let v = A * l

    return Int(floor(v))
}
