class CommunityDetail < ApplicationRecord
  belongs_to :community

  enum sex_limit: {
    male_only: 0, female_only: 1, others_only: 2
  }
  enum activity_area_limit: {
    hokkaido_only: 0, aomori_only: 1, iwate_only: 2, miyagi_only: 3, akita_only: 4, yamagata_only: 5, fukushima_only: 6,
    ibaraki_only: 7, tochigi_only: 8, gunma_only: 9, saitama_only: 10, chiba_only: 11, tokyo_only: 12, kanagawa_only: 13,
    niigata_only: 14, toyama_only: 15, ishikawa_only: 16, fukui_only: 17, yamanashi_only: 18, nagano_only: 19, gifu_only: 20, shizuoka_only: 21, aichi_only: 22,
    mie_only: 23, shiga_only: 24, kyoto_only: 25, osaka_only: 26, hyogo_only: 27, nara_only: 28, wakayama_only: 29,
    tottori_only: 30, shimane_only: 31, okayama_only: 32, hiroshima_only: 33, yamaguchi_only: 34,
    tokushima_only: 35, kagawa_only: 36, ehime_only: 37, kochi_only: 38,
    fukuoka_only: 39, saga_only: 40, nagasaki_only: 41, kumamoto_only: 42, oita_only: 43, miyazaki_only: 44, kagoshima_only: 45, okinawa_only: 46
  }
  enum recruiting_status: {
    recruiting: 0, closed: 1, secret: 2
  }
end
